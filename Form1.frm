VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   4185
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   5880
   LinkTopic       =   "Form1"
   ScaleHeight     =   4185
   ScaleWidth      =   5880
   StartUpPosition =   3  'Windows Default
   Begin VB.OptionButton Option6 
      Caption         =   "Option6"
      Height          =   375
      Left            =   3600
      TabIndex        =   15
      Top             =   3480
      Width           =   2055
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   240
      TabIndex        =   14
      Top             =   2880
      Width           =   1215
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   720
      TabIndex        =   9
      Top             =   2400
      Width           =   735
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   720
      TabIndex        =   8
      Top             =   2040
      Width           =   735
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   720
      TabIndex        =   7
      Top             =   1680
      Width           =   735
   End
   Begin VB.OptionButton Option5 
      Caption         =   "Option5"
      Height          =   495
      Left            =   3600
      TabIndex        =   6
      Top             =   2280
      Width           =   2055
   End
   Begin VB.OptionButton Option4 
      Caption         =   "Option4"
      Height          =   495
      Left            =   3600
      TabIndex        =   5
      Top             =   1680
      Width           =   2055
   End
   Begin VB.OptionButton Option3 
      Caption         =   "Option3"
      Height          =   495
      Left            =   3600
      TabIndex        =   4
      Top             =   2880
      Width           =   2055
   End
   Begin VB.OptionButton Option2 
      Caption         =   "Option1"
      Height          =   495
      Left            =   3600
      TabIndex        =   3
      Top             =   1080
      Width           =   2055
   End
   Begin VB.OptionButton Option1 
      Caption         =   "Option1"
      Height          =   495
      Left            =   3600
      TabIndex        =   2
      Top             =   480
      Width           =   2055
   End
   Begin VB.Label Label10 
      Caption         =   "TP:"
      Height          =   255
      Left            =   240
      TabIndex        =   18
      Top             =   2400
      Width           =   375
   End
   Begin VB.Label Label9 
      Caption         =   "P2:"
      Height          =   255
      Left            =   240
      TabIndex        =   17
      Top             =   2040
      Width           =   495
   End
   Begin VB.Label Label7 
      Caption         =   "P1:"
      Height          =   255
      Left            =   240
      TabIndex        =   16
      Top             =   1680
      Width           =   255
   End
   Begin VB.Label Label6 
      Height          =   375
      Left            =   2160
      TabIndex        =   13
      Top             =   3720
      Width           =   2055
   End
   Begin VB.Label Label5 
      Height          =   255
      Left            =   720
      TabIndex        =   12
      Top             =   3600
      Width           =   495
   End
   Begin VB.Label Label4 
      Caption         =   "Label4"
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   3600
      Width           =   495
   End
   Begin VB.Label Label3 
      Height          =   255
      Left            =   240
      TabIndex        =   10
      Top             =   1080
      Width           =   3135
   End
   Begin VB.Label Label2 
      Caption         =   "Label2"
      Height          =   255
      Left            =   3120
      TabIndex        =   1
      Top             =   120
      Width           =   2655
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   2895
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Function calcularMedia(ByVal p1 As Double, ByVal p2 As Double, ByVal t1 As Double, Optional ByVal t2 As Double = 0) As Double
    If t2 <> 0 Then
        calcularMedia = (p1 + p2 + t1 + t2) / 4
    Else
        calcularMedia = (p1 + p2 + t1) / 3
    End If
End Function

Private Sub Form_Load()
    Me.Caption = "Simulador de Notas"
    Label1.Caption = "v3.0 (c)Raziel, 2023"
    Label2.Caption = "Escolha a disciplina:"
    Label4.Caption = "Média: "
    Option1.Caption = "Economia e Finanças (Frederico)"
    Option2.Caption = "Sociedade e Tecnologia (Marcelo)"
    Option3.Caption = "Estruturas de Dados (Fernanda)"
    Option4.Caption = "Engenharia de Software II (Simone)"
    Option5.Caption = "Interação Humano Computador (Fábio)"
    Option6.Caption = "Estatística Aplicada (Sávio)"
    Command1.Caption = "Calcular"

End Sub

Private Sub Command1_Click()
    Dim media As Double
    Dim p1 As Double
    Dim p2 As Double
    Dim t1 As Double
    Dim t2 As Double
    
    If Option1.Value Then
        Label3.Caption = "Economia e Finanças (Frederico)"
    ElseIf Option2.Value Then
        Label3.Caption = "Sociedade e Tecnologia (Marcelo)"
    ElseIf Option3.Value Then
        Label3.Caption = "Estruturas de Dados (Fernanda)"
    ElseIf Option4.Value Then
        Label3.Caption = "Engenharia de Software II (Simone)"
    ElseIf Option5.Value Then
        Label3.Caption = "Interação Humano Computador (Fábio)"
    ElseIf Option6.Value Then
        Label3.Caption = "Estatística Aplicada (Sávio)"
    End If
    
    p1 = Val(Text1.Text)
    p2 = Val(Text2.Text)
    t1 = Val(Text3.Text)
    
    If Option6.Value Then
        media = (7 * p1 + 7 * p2 + 6 * t1 + t2) / 20
    Else
        media = calcularMedia(p1, p2, t1)
    End If
    
    Label5.Caption = Format(media, "0.00")
    
    If media < 6 Then
        Me.ForeColor = vbRed
        Label6.Caption = "REPROVADO!"
    Else
        Me.ForeColor = vbGreen
        Label6.Caption = "APROVADO!"
    End If
End Sub


