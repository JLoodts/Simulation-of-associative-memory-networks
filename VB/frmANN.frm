VERSION 5.00
Begin VB.MDIForm frmANN 
   BackColor       =   &H8000000C&
   Caption         =   "     Simulation of Associative Memory Networks"
   ClientHeight    =   7725
   ClientLeft      =   165
   ClientTop       =   735
   ClientWidth     =   10455
   Icon            =   "frmANN.frx":0000
   LinkTopic       =   "MDIForm1"
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu mnuSpace 
      Caption         =   " "
      Enabled         =   0   'False
   End
   Begin VB.Menu mnuPlot 
      Caption         =   "Plot"
      Begin VB.Menu mnuPlotHopfield 
         Caption         =   "Hopfield"
         Begin VB.Menu mnuPlotHopfieldMvsTemp 
            Caption         =   "m vs temperature"
         End
         Begin VB.Menu mnuPlotHopfieldMvsT 
            Caption         =   "m vs iterations"
         End
      End
      Begin VB.Menu mnuQIsing 
         Caption         =   "QIsing"
         Begin VB.Menu mnuPlotQIsingMvsT 
            Caption         =   "m vs iterations"
         End
         Begin VB.Menu mnuPlotQIsingLvsM 
            Caption         =   "l vs m"
         End
         Begin VB.Menu mnuPlotQIsingMvsAlfa 
            Caption         =   "m vs alfa"
         End
      End
      Begin VB.Menu mnuBEG 
         Caption         =   "BEG"
         Begin VB.Menu mnuPlotBEGMvsT 
            Caption         =   "m vs iterations"
         End
         Begin VB.Menu mnuPlotBEGLvsM 
            Caption         =   "l vs m"
         End
         Begin VB.Menu mnuPlotBEGMvsAlfa 
            Caption         =   "m vs alfa"
         End
      End
   End
   Begin VB.Menu mnuWindow 
      Caption         =   "Window"
      Begin VB.Menu mnuWindowTileHorizontal 
         Caption         =   "Tile Horizontally"
      End
      Begin VB.Menu mnuWindowTileVertically 
         Caption         =   "Tile Vertically"
      End
      Begin VB.Menu mnuWindowCascade 
         Caption         =   "Cascade"
      End
      Begin VB.Menu mnuWindowArrangeIcons 
         Caption         =   "Arrange Icons"
      End
      Begin VB.Menu mnuWindowStreep01 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWindowsWindows 
         Caption         =   "Windows"
         WindowList      =   -1  'True
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "Help"
      Begin VB.Menu mnuHelpAbout 
         Caption         =   "About"
      End
   End
End
Attribute VB_Name = "frmANN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit


Private Sub mnuHelpAbout_Click()
    frmAbout.Show vbModal
End Sub

Private Sub mnuPlotBEGLvsM_Click()
    Dim frmDummy As New frmBEGLvsM
    frmDummy.Show
    Set frmDummy = Nothing
End Sub

Private Sub mnuPlotBEGMvsAlfa_Click()
    Dim frmDummy As New frmBEGMvsAlfa
    frmDummy.Show
    Set frmDummy = Nothing
End Sub

Private Sub mnuPlotBEGMvsT_Click()
    Dim frmDummy As New frmBEGMvsT
    frmDummy.Show
    Set frmDummy = Nothing
End Sub

Private Sub mnuPlotHopfieldMvsT_Click()
    Dim frmDummy As New frmHopfieldMvsT
    frmDummy.Show
    Set frmDummy = Nothing
End Sub

Private Sub mnuPlotHopfieldMvsTemp_Click()
    Dim frmDummy As New frmHopfieldMvsTemp
    frmDummy.Show
    Set frmDummy = Nothing
End Sub

Private Sub mnuPlotQIsingMvsAlfa_Click()
    Dim frmDummy As New frmQIsingMvsAlfa
    frmDummy.Show
    Set frmDummy = Nothing
End Sub

Private Sub mnuPlotQIsingLvsM_Click()
    Dim frmDummy As New frmQIsingLvsM
    frmDummy.Show
    Set frmDummy = Nothing
End Sub

Private Sub mnuPlotQIsingMvsT_Click()
    Dim frmDummy As New frmQIsingMvsT
    frmDummy.Show
    Set frmDummy = Nothing
End Sub

Private Sub mnuWindowArrangeIcons_Click()
    Me.Arrange vbArrangeIcons
End Sub

Private Sub mnuWindowCascade_Click()
    Me.Arrange vbCascade
End Sub

Private Sub mnuWindowTileHorizontal_Click()
    Me.Arrange vbTileHorizontal
End Sub

Private Sub mnuWindowTileVertically_Click()
    Me.Arrange vbTileVertical
End Sub
