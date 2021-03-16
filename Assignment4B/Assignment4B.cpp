///////////////////////////////////////////////////////////////
// Parabola.cpp File


#include <windows.h>

LRESULT __stdcall WndProc(HWND, UINT, WPARAM, LPARAM);

int APIENTRY WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, LPSTR lpCmdLine, int

	nShowCmd)
{
	char szWindowClass[] = "Parabola shape painting";

	// register the window
	WNDCLASSEX wcex;

	wcex.cbSize = sizeof(WNDCLASSEX);
	wcex.style = CS_HREDRAW | CS_VREDRAW | CS_OWNDC;
	wcex.lpfnWndProc = (WNDPROC)WndProc;
	wcex.cbClsExtra = 0;
	wcex.cbWndExtra = 0;
	wcex.hInstance = hInstance;
	wcex.hIcon = NULL;
	wcex.hCursor = LoadCursor(NULL, IDC_ARROW);
	wcex.hbrBackground = (HBRUSH)::GetStockObject(WHITE_BRUSH);
	wcex.lpszMenuName = NULL;
	wcex.lpszClassName = szWindowClass;
	wcex.hIconSm = NULL;

	::RegisterClassEx(&wcex);


	// create window
	HWND hWnd = ::CreateWindowEx(
		WS_EX_CLIENTEDGE,	// extended style
		szWindowClass,	// class name
		"parabola",		// title (parabola)
		WS_OVERLAPPEDWINDOW,	// style the window
		CW_USEDEFAULT,	// intual X
		CW_USEDEFAULT,	// initial Y 
		CW_USEDEFAULT,	// width
		CW_USEDEFAULT,	// height
		NULL,		// handle of parent window
		NULL,	        // handle of menu
		hInstance,	// Instance
		NULL);

	::ShowWindow(hWnd, nShowCmd);
	::UpdateWindow(hWnd);

	// enter the message  loop
	MSG msg;
	while (::GetMessage(&msg, NULL, 0, 0))
	{
		::TranslateMessage(&msg);
		::DispatchMessage(&msg);
	}


	return 1;
}


// message processing 
LRESULT __stdcall WndProc(HWND hWnd, UINT message, WPARAM wParam, LPARAM lParam)
{
#define SEGMENTS 400  // point number?setting 500 points in a period?
#define PI 3.1415926  // PI ratio
	HDC hdc;
	PAINTSTRUCT ps;
	RECT rt;
	int cxClient, cyClient;
	POINT pt[SEGMENTS];
	int i;

	switch (message)
	{
	case WM_PAINT:
	{
		HDC hdc = ::BeginPaint(hWnd, &ps);

		// Get the size of client area
		RECT rt;
		GetClientRect(hWnd, &rt);
		int cx = rt.right;
		int cy = rt.bottom;
		int point;

		// set the size to 500x500?origin of the coordinates(0,0)
		::SetMapMode(hdc, MM_ANISOTROPIC);

		{
			::SetWindowExtEx(hdc, SEGMENTS/3, SEGMENTS/3, NULL);
			::SetViewportExtEx(hdc, cx, cy, NULL);
			::SetViewportOrgEx(hdc, 0, 0, NULL);

			// Drawing the axis

			{
				::MoveToEx(hdc, SEGMENTS / 3, 0, NULL);
				::LineTo(hdc, SEGMENTS / 3, SEGMENTS);
			}

			// determine the 400 points

			for (i = 0; i < SEGMENTS; i++)
			{
				point = i + 1;
				pt[i].x = point;
				pt[i].y = 0.01 * (point - SEGMENTS / 2) * (point - SEGMENTS / 2);

			}
			// link them
			::Polyline(hdc, pt, SEGMENTS);

		}
		::EndPaint(hWnd, &ps);

	}
	break;
	case WM_DESTROY:
		::PostQuitMessage(0);
		break;
	}
	return ::DefWindowProc(hWnd, message, wParam, lParam);
}
