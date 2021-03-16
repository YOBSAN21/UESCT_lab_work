//creating of child process
#include <stdio.h>
#include <windows.h>
#include "stdafx.h"
#include <iostream>
using namespace std;
int main()
{
    HANDLE hProcess = 0;
    HANDLE hThread = 0;
    STARTUPINFO si;
    PROCESS_INFORMATION pi;
    DWORD dwProcessID = 0;
    DWORD dwThreadID = 0;
    BOOL bProcess;
    //step1 filling the memory block of STARTUPINFO & PROCESS_INFO
    ZeroMemory(&si, sizeof(si));
    ZeroMemory(&pi, sizeof(pi));
    //step2 Create process function
    bProcess = CreateProcess(
        L"C:/Users/Yobsan/source/repos/greeting/Debug/greeting.exe", //app name
        NULL, //command line
        NULL, //process attributes
        NULL, //thread attributes
        FALSE, //inherit handle
        0,     //creation flag 
        NULL,   //environment variables
        NULL,  //current Directory
        &si,   //start info
        &pi);   //process info
    //step3  checking the process created or not
    if (bProcess == FALSE) {
        cout << "Create process Failed" << GetLastError() << endl;
    }
    cout << "Create process success" << endl;
    //printing the process ID and Thread
    cout << "Process ID =" << pi.dwProcessId << endl;
    cout << "Process ID =" << pi.dwThreadId << endl;
    //wait for single object
    WaitForSingleObject(pi.hProcess, INFINITE);
    //step6 closing the handle
    CloseHandle(pi.hProcess);
    CloseHandle(pi.hThread);
    system("Pause");
    return 0;
}