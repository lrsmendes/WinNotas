#include "stdafx.h"
#include <Windows.h>
#include <string>
#include <sstream>

#define COLOR_BACKGROUND RGB(240, 240, 240)
#define COLOR_CONTROL RGB(255, 255, 255)
#define COLOR_SELECTED RGB(210, 210, 255)

// Function to calculate the average of three grades
double calcularMedia(double p1, double p2, double t1, double t2 = 0)
{
    double media = (p1 + p2 + t1) / 3;
    return media;
}

// Window procedure for the main window
LRESULT CALLBACK WndProc(HWND hwnd, UINT msg, WPARAM wParam, LPARAM lParam)
{
    static HWND hComboBox, hP1, hP2, hT1, hOutput;
    switch (msg)
    {
    case WM_CREATE:
        // Create the combo box for selecting the discipline
 hComboBox = CreateWindowEx(0, L"COMBOBOX", NULL, CBS_DROPDOWNLIST | WS_CHILD | WS_VISIBLE | CBS_HASSTRINGS,
            30, 40, 300, 200, hwnd, NULL, GetModuleHandle(NULL), NULL);
        // Add the discipline options to the combo box
        SendMessage(hComboBox, CB_ADDSTRING, 0, (LPARAM)L"Economia e Finanças (Frederico)");
        SendMessage(hComboBox, CB_ADDSTRING, 0, (LPARAM)L"Sociedade e Tecnologia (Marcelo)");
        SendMessage(hComboBox, CB_ADDSTRING, 0, (LPARAM)L"Estruturas de Dados (Fernanda)");
        SendMessage(hComboBox, CB_ADDSTRING, 0, (LPARAM)L"Engenharia de Software II (Simone)");
        SendMessage(hComboBox, CB_ADDSTRING, 0, (LPARAM)L"Interação Humano Computador (Fábio)");
        SendMessage(hComboBox, CB_ADDSTRING, 0, (LPARAM)L"Estatística Aplicada (Sávio)");
        SendMessage(hComboBox, CB_SETCURSEL, 0, 0);
        // Create the edit boxes for entering the grades
        hP1 = CreateWindowEx(0, L"EDIT", NULL, WS_CHILD | WS_VISIBLE | WS_BORDER | ES_NUMBER,
            20, 250, 100, 30, hwnd, NULL, GetModuleHandle(NULL), NULL);
        hP2 = CreateWindowEx(0, L"EDIT", NULL, WS_CHILD | WS_VISIBLE | WS_BORDER | ES_NUMBER,
            140, 250, 100, 30, hwnd, NULL, GetModuleHandle(NULL), NULL);
        hT1 = CreateWindowEx(0, L"EDIT", NULL, WS_CHILD | WS_VISIBLE | WS_BORDER | ES_NUMBER,
            260, 250, 100, 30, hwnd, NULL, GetModuleHandle(NULL), NULL);
        // Create the button for calculating the average
        CreateWindowEx(0, L"BUTTON", L"Calcular Média", WS_CHILD | WS_VISIBLE | BS_PUSHBUTTON,
            20, 300, 340, 30, hwnd, (HMENU)1, GetModuleHandle(NULL), NULL);
        // Create the output box for displaying the average
        hOutput = CreateWindowEx(0, L"EDIT", NULL, WS_CHILD | WS_VISIBLE | WS_BORDER | ES_READONLY | ES_CENTER,
            20, 350, 340, 30, hwnd, NULL, GetModuleHandle(NULL), NULL);
        break;
    case WM_COMMAND:
        switch (LOWORD(wParam))
        {
        case 1:
            // Calculate the average when the button is clicked
            double p1, p2, t1, media;
            // Get the selected discipline
            int index = SendMessage(hComboBox, CB_GETCURSEL, 0, 0);
            WCHAR buffer[128];
            SendMessage(hComboBox, CB_GETLBTEXT, index, (LPARAM)buffer);
            std::wstring discipline(buffer);

            // Get the grades from the edit boxes
            wchar_t bufferP1[10], bufferP2[10], bufferT1[10];
            GetWindowText(hP1, bufferP1, 10);
            GetWindowText(hP2, bufferP2, 10);
            GetWindowText(hT1, bufferT1, 10);
            std::wstringstream ssP1(bufferP1), ssP2(bufferP2), ssT1(bufferT1);
            ssP1 >> p1;
            ssP2 >> p2;
            ssT1 >> t1;

            // Calculate the average and display it in the output box
            media = calcularMedia(p1, p2, t1);
            std::wostringstream ssMedia;
            ssMedia << L"Média em " << discipline << L": " << media;
            SetWindowText(hOutput, ssMedia.str().c_str());
            break;
        }
        break;
    case WM_DESTROY:
        PostQuitMessage(0);
        break;
    default:
        return DefWindowProc(hwnd, msg, wParam, lParam);
    }
    return 0;
}

// WinMain function for the Windows application
int WINAPI wWinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PWSTR pCmdLine, int nCmdShow)
{
    // Register the window class
    WNDCLASS wc = { };
    wc.lpfnWndProc = WndProc;
    wc.hInstance = hInstance;
    wc.lpszClassName = L"ClasseJanela";
    RegisterClass(&wc);

    // Create the window
    HWND hwnd = CreateWindowEx(0, L"ClasseJanela", L"Calculadora de Médias",
        WS_OVERLAPPEDWINDOW, CW_USEDEFAULT, CW_USEDEFAULT, 400, 450, NULL, NULL, hInstance, NULL);

    if (hwnd == NULL)
    {
        return 0;
    }

    // Show the window
    ShowWindow(hwnd, nCmdShow);

    // Run the message loop
    MSG msg = { };
    while (GetMessage(&msg, NULL, 0, 0))
    {
        TranslateMessage(&msg);
        DispatchMessage(&msg);
    }

    return 0;
}
