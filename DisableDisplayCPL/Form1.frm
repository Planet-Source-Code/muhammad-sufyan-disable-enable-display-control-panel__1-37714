VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Disable the Display control panel"
   ClientHeight    =   1305
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4110
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   1305
   ScaleWidth      =   4110
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Enable the Display control panel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   255
      TabIndex        =   0
      Top             =   165
      Width           =   3600
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Copyright 2002 Muhammad Sufyan"
      Height          =   195
      Left            =   750
      TabIndex        =   1
      Top             =   900
      Width           =   2475
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'-----By Muhammad Sufyan (sufyan79@yahoo.com | http://sufyan.nativesearch.net)-----

Sub RegCreate(RegKey As String, RegValue As String)

' Create the RegEdit Object
Set RegEdit = CreateObject("WScript.Shell")

' Set The Value
RegEdit.RegWrite RegKey, RegValue

End Sub

Private Sub Command1_Click()


If Command1.Caption = "Disable the Display control panel" Then
' Create The Key
RegCreate "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispCPL", 1

Command1.Caption = "Enable the Display control panel"
Form1.Caption = Command1.Caption
Else
' Delete the Key
RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System\NoDispCPL"

Command1.Caption = "Disable the Display control panel"
Form1.Caption = Command1.Caption
End If


End Sub

Sub RegDelete(RegKey As String)

' Create the RegEdit Object
Set RegEdit = CreateObject("WScript.Shell")

' Delete Key or Folder
RegEdit.RegDelete RegKey

End Sub

Private Sub Form_Load()
'Read registry
Command1.Caption = GetSetting(App.Title, "Settings", "DisableDisplayCPL", "Disable the Display control panel")
Form1.Caption = Command1.Caption

End Sub

Private Sub Form_Unload(Cancel As Integer)
'Write to registry
SaveSetting App.Title, "Settings", "DisableDisplayCPL", Command1.Caption

End Sub
