#include <windows.h>
#include <iostream>
#include <fstream>
#include <conio.h>
#include <string>

using namespace std;

// Declare the global variable
CRITICAL_SECTION cs;
static string account = "Administrator";
string name, descr, type, date, uid, amount;
int choice;
boolean adminID;

LONG WINAPI ThreadA(LONG);
LONG WINAPI ThreadB(LONG);

void UsingCriticalSection();
void WaitForThreads(int limit, HANDLE hThrd[2], BOOL b, DWORD wait);
void writeRecords();
void modifyRecords();
void readRecords();
void startMenu(string adminName);