VERSION 5.00
Begin VB.Form frmAbout 
   Caption         =   "About this Program"
   ClientHeight    =   4065
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5610
   Icon            =   "frmAbout.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4065
   ScaleWidth      =   5610
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdOK 
      Cancel          =   -1  'True
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   345
      Left            =   4155
      TabIndex        =   0
      Top             =   3570
      Width           =   1245
   End
   Begin VB.Image Image1 
      Height          =   945
      Left            =   4635
      Picture         =   "frmAbout.frx":014A
      Stretch         =   -1  'True
      Top             =   855
      Width           =   555
   End
   Begin VB.Label Label7 
      Caption         =   "Project work for obtaining the degree Master in Artificial Intelligence (Engineering and Computer Science Option) 2001-2002"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1005
      Left            =   225
      TabIndex        =   8
      Top             =   2880
      Width           =   5010
   End
   Begin VB.Label lblPlatform 
      Alignment       =   1  'Right Justify
      AutoSize        =   -1  'True
      Caption         =   "by Jimmy Loodts"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      Left            =   480
      TabIndex        =   7
      Top             =   2460
      Width           =   1560
   End
   Begin VB.Label Label1 
      Alignment       =   2  'Center
      Caption         =   "Simulation of Associative Memory Networks"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   15.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   360
      Left            =   165
      TabIndex        =   6
      Top             =   180
      Width           =   5340
   End
   Begin VB.Label Label2 
      Caption         =   "Promotor: Prof. Désiré Bollé"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   225
      TabIndex        =   5
      Top             =   615
      Width           =   3090
   End
   Begin VB.Label Label3 
      Caption         =   "Supervisor: Toni Verbeiren"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   225
      TabIndex        =   4
      Top             =   960
      Width           =   3075
   End
   Begin VB.Label Label4 
      Caption         =   "Statistical Mechanics and Neural Networks Group"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   225
      TabIndex        =   3
      Top             =   1425
      Width           =   2940
   End
   Begin VB.Label Label5 
      Caption         =   "Institute for Theoretical Physics"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   300
      Left            =   225
      TabIndex        =   2
      Top             =   2055
      Width           =   3420
   End
   Begin VB.Label Label6 
      Caption         =   "_________ Katholieke Universiteit Leuven"
      Height          =   840
      Left            =   4545
      TabIndex        =   1
      Top             =   1665
      Width           =   840
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdOK_Click()
  Unload Me
End Sub

