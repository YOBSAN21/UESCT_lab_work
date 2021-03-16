#include <windows.h>
#include <stdio.h>

#define MAX_SEM_COUNT 2
#define THREADCOUNT 5

HANDLE ghSemaphore;
HANDLE ghMutex_1, ghMutex_2;

DWORD WINAPI ThreadProc(LPVOID);

int main(void)
{
    HANDLE aThread[THREADCOUNT];
    DWORD ThreadID;
    int i;

    // Create a semaphore with initial and max counts of MAX_SEM_COUNT

    ghSemaphore = CreateSemaphore(
        NULL,           // default security attributes
        MAX_SEM_COUNT,  // initial count
        MAX_SEM_COUNT,  // maximum count
        NULL);          // unnamed semaphore

    if (ghSemaphore == NULL)
    {
        printf("CreateSemaphore error: %d\n", GetLastError());
        return 1;
    }

    // Create a mutex with no initial owner

    ghMutex_1 = CreateMutex(
        NULL,              // default security attributes
        FALSE,             // initially not owned
        NULL);             // unnamed mutex

    if (ghMutex_1 == NULL)
    {
        printf("CreateMutex 1 error: %d\n", GetLastError());
        return 1;
    }

    ghMutex_2 = CreateMutex(
        NULL,              // default security attributes
        FALSE,             // initially not owned
        NULL);             // unnamed mutex

    if (ghMutex_2 == NULL)
    {
        printf("CreateMutex 2 error: %d\n", GetLastError());
        return 1;
    }

    // Create worker threads

    for (i = 0; i < THREADCOUNT; i++)
    {
        aThread[i] = CreateThread(
            NULL,       // default security attributes
            0,          // default stack size
            (LPTHREAD_START_ROUTINE)ThreadProc,
            NULL,       // no thread function arguments
            0,          // default creation flags
            &ThreadID); // receive thread identifier

        if (aThread[i] == NULL)
        {
            printf("CreateThread error: %d\n", GetLastError());
            return 1;
        }
        Sleep(1000);
    }

    // Wait for all threads to terminate

    WaitForMultipleObjects(THREADCOUNT, aThread, TRUE, INFINITE);

    // Close thread, semaphore and mutex handles

    for (i = 0; i < THREADCOUNT; i++)
        CloseHandle(aThread[i]);

    CloseHandle(ghSemaphore);

    CloseHandle(ghMutex_1);
    CloseHandle(ghMutex_2);

    return 0;
}

DWORD WINAPI ThreadProc(LPVOID lpParam)
{

    // lpParam not used in this example
    UNREFERENCED_PARAMETER(lpParam);

    DWORD dwWaitResult;
    BOOL bContinue = TRUE;

    while (bContinue)
    {
        dwWaitResult = WaitForSingleObject(
            ghSemaphore,    // handle to mutex
            INFINITE);  // no time-out interval

        switch (dwWaitResult)
        {
            // The semaphore object was signaled.
        case WAIT_OBJECT_0:
            __try
            {
                // TODO: train enters the railway station

                dwWaitResult = WaitForSingleObject(
                    ghMutex_1,    // handle to mutex
                    0L);  // no time-out interval

                switch (dwWaitResult)
                {
                    // The thread got ownership of the mutex
                case WAIT_OBJECT_0:
                {
                    __try {
                        // TODO: Train enters the platform
                        printf("Train %d: entered the platform 1\n", GetCurrentThreadId());
                        Sleep(1000);
                        bContinue = FALSE;
                    }

                    __finally {
                        // Release ownership of the mutex object
                        if (!ReleaseMutex(ghMutex_1))
                        {
                            // Handle error.
                        }
                        else
                            printf("Train: %d left the platform 1\n", GetCurrentThreadId());

                    }
                    break;
                }

                // The mutes was nonsignaled, so a time-out occurred.
                case WAIT_TIMEOUT:
                {
                    printf("Platform 1 is busy. Train %d: moving to the next platform\n", GetCurrentThreadId());
                    goto platform_2;
                    break;
                }

                // The thread got ownership of an abandoned mutex
                case WAIT_ABANDONED:
                    return FALSE;
                }


            platform_2:
                dwWaitResult = WaitForSingleObject(
                    ghMutex_2,    // handle to mutex
                    0L);  // no time-out interval

                switch (dwWaitResult)
                {
                    // The thread got ownership of the mutex
                case WAIT_OBJECT_0:
                    __try {
                        // TODO: Train enters the platform
                        printf("Train %d: entered the platform 2\n", GetCurrentThreadId());
                        Sleep(1000);
                        bContinue = FALSE;
                    }

                    __finally {
                        // Release ownership of the mutex object
                        if (!ReleaseMutex(ghMutex_2))
                        {
                            // Handle error.
                        }
                        else
                            printf("Train: %d left the platform 2\n", GetCurrentThreadId());
                    }
                    break;

                    // The mutes was nonsignaled, so the train has been to platform 1.
                case WAIT_TIMEOUT:
                {
                    break;
                }

                // The thread got ownership of an abandoned mutex
                case WAIT_ABANDONED:
                    return FALSE;
                }

            }


            __finally {
                // Release ownership of the mutex object
                if (!ReleaseSemaphore(
                    ghSemaphore,  // handle to semaphore
                    1,            // increase count by one
                    NULL))       // not interested in previous count
                {
                    printf("ReleaseSemaphore error: %d\n", GetLastError());
                }
                else
                    printf("Train: %d left the railway station\n", GetCurrentThreadId());
            }
            break;

        case WAIT_ABANDONED:
            return FALSE;
        }
    }


    return TRUE;
}