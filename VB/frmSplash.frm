VERSION 5.00
Begin VB.Form frmSplash 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   8685
   ClientLeft      =   255
   ClientTop       =   1410
   ClientWidth     =   10605
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   Icon            =   "frmSplash.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form2"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8685
   ScaleWidth      =   10605
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      Height          =   8460
      Left            =   105
      TabIndex        =   0
      Top             =   105
      Width           =   10440
      Begin VB.Timer tmrSleep 
         Interval        =   3000
         Left            =   9660
         Top             =   7770
      End
      Begin VB.Image Image1 
         Height          =   1890
         Left            =   8280
         Picture         =   "frmSplash.frx":08CA
         Stretch         =   -1  'True
         Top             =   5040
         Width           =   1110
      End
      Begin VB.Label Label6 
         Caption         =   "_________ Katholieke Universiteit Leuven"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1335
         Left            =   8280
         TabIndex        =   7
         Top             =   6840
         Width           =   1200
      End
      Begin VB.Label Label5 
         Caption         =   "Institute for Theoretical Physics"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   615
         Left            =   720
         TabIndex        =   6
         Top             =   6960
         Width           =   6255
      End
      Begin VB.Label Label4 
         Caption         =   "Statistical Mechanics and Neural Networks Group"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   975
         Left            =   720
         TabIndex        =   5
         Top             =   6600
         Width           =   6495
      End
      Begin VB.Label Label3 
         Caption         =   "Supervisor: Toni Verbeiren"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   735
         Left            =   720
         TabIndex        =   4
         Top             =   6000
         Width           =   3615
      End
      Begin VB.Label Label2 
         Caption         =   "Promotor: Prof. Désiré Bollé"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   13.5
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   855
         Left            =   720
         TabIndex        =   3
         Top             =   5520
         Width           =   4095
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "Simulation of Associative Memory Networks"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   48
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   4000
         Left            =   1200
         TabIndex        =   2
         Top             =   1080
         Width           =   7995
      End
      Begin VB.Label lblPlatform 
         Alignment       =   1  'Right Justify
         AutoSize        =   -1  'True
         Caption         =   "Jimmy Loodts"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   14.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   690
         TabIndex        =   1
         Top             =   7725
         Width           =   1785
      End
   End
End
Attribute VB_Name = "frmSplash"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Option Explicit

Private Sub tmrSleep_Timer()
    frmANN.WindowState = vbMaximized
    frmANN.Show
    Unload Me
End Sub
