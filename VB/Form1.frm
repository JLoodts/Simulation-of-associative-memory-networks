VERSION 5.00
Object = "{C643EB3F-235C-4181-9B55-36A268833718}#7.0#0"; "olch2x7.ocx"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmHopfieldMvsT 
   Caption         =   "Hopfield: m vs iterations"
   ClientHeight    =   9240
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8475
   LinkTopic       =   "Form1"
   ScaleHeight     =   9240
   ScaleWidth      =   8475
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Parameters"
      Height          =   5100
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   6360
      Begin VB.Frame Frame8 
         Caption         =   "Temperature"
         Height          =   1725
         Left            =   4590
         TabIndex        =   24
         Top             =   315
         Width           =   1545
         Begin VB.TextBox txtDimX 
            Height          =   285
            Left            =   450
            TabIndex        =   27
            Text            =   "100"
            Top             =   1305
            Width           =   915
         End
         Begin VB.TextBox txtXMax 
            Height          =   285
            Left            =   765
            TabIndex        =   26
            Text            =   "1"
            Top             =   675
            Width           =   555
         End
         Begin VB.TextBox txtXMin 
            Height          =   285
            Left            =   765
            TabIndex        =   25
            Text            =   "0"
            Top             =   315
            Width           =   555
         End
         Begin VB.Label Label8 
            Caption         =   "# Samples :"
            Height          =   240
            Left            =   180
            TabIndex        =   30
            Top             =   1035
            Width           =   1050
         End
         Begin VB.Label Label7 
            Caption         =   "Max :"
            Height          =   195
            Left            =   180
            TabIndex        =   29
            Top             =   675
            Width           =   465
         End
         Begin VB.Label Label4 
            Caption         =   "Min :"
            Height          =   195
            Index           =   0
            Left            =   180
            TabIndex        =   28
            Top             =   315
            Width           =   420
         End
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "Save"
         Height          =   330
         Left            =   4815
         TabIndex        =   23
         Top             =   4155
         Width           =   1140
      End
      Begin VB.CommandButton cmdLoad 
         Caption         =   "Load"
         Height          =   330
         Left            =   4815
         TabIndex        =   22
         Top             =   3735
         Width           =   1140
      End
      Begin VB.CommandButton cmdPlot 
         Caption         =   "Plot"
         Height          =   330
         Left            =   4815
         TabIndex        =   21
         Top             =   4590
         Width           =   1140
      End
      Begin VB.Frame Frame6 
         Caption         =   "Update"
         Height          =   915
         Left            =   180
         TabIndex        =   18
         Top             =   1125
         Width           =   4245
         Begin VB.OptionButton optUpdateAsynch 
            Caption         =   "Asynchronously"
            Height          =   285
            Left            =   900
            TabIndex        =   20
            Top             =   225
            Value           =   -1  'True
            Width           =   1545
         End
         Begin VB.OptionButton optSynch 
            Caption         =   "Synchronously"
            Height          =   240
            Left            =   900
            TabIndex        =   19
            Top             =   540
            Width           =   1590
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Size"
         Height          =   735
         Left            =   180
         TabIndex        =   15
         Top             =   315
         Width           =   4245
         Begin VB.TextBox txtN 
            Height          =   285
            Left            =   900
            TabIndex        =   16
            Text            =   "1000"
            Top             =   270
            Width           =   960
         End
         Begin VB.Label Label6 
            Caption         =   "neurons"
            Height          =   240
            Left            =   1935
            TabIndex        =   17
            Top             =   315
            Width           =   1005
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Maximum"
         Height          =   735
         Left            =   180
         TabIndex        =   12
         Top             =   2115
         Width           =   4245
         Begin VB.TextBox txtMaxNrIterations 
            Height          =   285
            Left            =   900
            TabIndex        =   13
            Text            =   "10000"
            Top             =   270
            Width           =   780
         End
         Begin VB.Label Label5 
            Caption         =   "iterations"
            Height          =   240
            Left            =   1755
            TabIndex        =   14
            Top             =   315
            Width           =   960
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Load parameter"
         Height          =   1140
         Left            =   180
         TabIndex        =   6
         Top             =   2925
         Width           =   4245
         Begin VB.HScrollBar sclAlfa 
            Height          =   240
            Left            =   1665
            Max             =   100
            TabIndex        =   9
            Top             =   360
            Width           =   2310
         End
         Begin VB.TextBox txtAlfa 
            Height          =   285
            Left            =   900
            TabIndex        =   8
            Text            =   "0.1"
            Top             =   315
            Width           =   465
         End
         Begin VB.TextBox txtAlfaCritPct 
            Height          =   285
            Left            =   900
            TabIndex        =   7
            Text            =   "10"
            Top             =   675
            Width           =   465
         End
         Begin VB.Label Label3 
            Caption         =   "Alfa :"
            Height          =   240
            Left            =   135
            TabIndex        =   11
            Top             =   345
            Width           =   420
         End
         Begin VB.Label Label1 
            Caption         =   "% of critical load"
            Height          =   240
            Left            =   1440
            TabIndex        =   10
            Top             =   720
            Width           =   1410
         End
      End
      Begin VB.Frame Frame5 
         Caption         =   "Overlap of beginstate with the target"
         Height          =   780
         Left            =   180
         TabIndex        =   3
         Top             =   4140
         Width           =   4245
         Begin VB.HScrollBar sclDeviation 
            Height          =   240
            Left            =   1665
            Max             =   100
            TabIndex        =   5
            Top             =   360
            Width           =   2310
         End
         Begin VB.TextBox txtDeviation 
            Height          =   285
            Left            =   900
            TabIndex        =   4
            Text            =   "0.1"
            Top             =   315
            Width           =   465
         End
      End
      Begin MSComDlg.CommonDialog cmnPath 
         Left            =   5130
         Top             =   2655
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
         CancelError     =   -1  'True
      End
   End
   Begin VB.Frame Frame7 
      Caption         =   "Plot"
      Height          =   3615
      Left            =   0
      TabIndex        =   0
      Top             =   5265
      Width           =   6405
      Begin C1Chart2D7.Chart2D Chart2D1 
         Height          =   3165
         Left            =   180
         TabIndex        =   1
         Top             =   270
         Width           =   6045
         _Version        =   458752
         _Revision       =   2
         _ExtentX        =   10663
         _ExtentY        =   5583
         _StockProps     =   0
         ControlProperties=   "Form1.frx":0000
      End
   End
End
Attribute VB_Name = "frmHopfieldMvsT"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Declare Function m_temp_Hopfield _
      Lib "D:\Jimmy\Thesis\ANNDLL02\release\ann.dll" _
                     (ByVal nameIn As String, ByVal nameOut As String) _
                     As Integer
                     
Private Declare Function m_t_Hopfield _
      Lib "D:\Jimmy\Thesis\ANNDLL02\release\ann.dll" _
                     (ByVal nameIn As String, ByVal nameOut As String) _
                     As Integer
                    
Private Declare Function m_t_QIsing _
      Lib "D:\Jimmy\Thesis\ANNDLL02\release\ann.dll" _
                     (ByVal nameIn As String, ByVal nameOut As String) _
                     As Integer

Private Declare Function m_t_BEG _
      Lib "D:\Jimmy\Thesis\ANNDLL02\release\ann.dll" _
                     (ByVal nameIn As String, ByVal nameOut As String) _
                     As Integer

Private Declare Function m_l_BEG _
      Lib "D:\Jimmy\Thesis\ANNDLL02\release\ann.dll" _
                     (ByVal nameIn As String, ByVal nameOut As String) _
                     As Integer
                     
Private Declare Function m_l_QIsing _
      Lib "D:\Jimmy\Thesis\ANNDLL02\release\ann.dll" _
                     (ByVal nameIn As String, ByVal nameOut As String) _
                     As Integer

Private Declare Function graphicsQIsing _
      Lib "D:\Jimmy\Thesis\ANNDLL02\release\ann.dll" _
                     (ByVal nameIn As String, ByVal fileName As String, _
                      ByVal nameOut As String) _
                     As Integer

Private Declare Function test _
      Lib "D:\Jimmy\Thesis\ANNDLL02\release\ann.dll" _
                     (ByVal name As String, ByRef alfa As Long, ByRef N As Integer) _
                     As Integer
                     
Private Const c_strFileNameIn As String = "D:/ANN_VB/data/m_temp_Hopfield_in.txt"
Private Const c_strFileNameOut As String = "D:/ANN_VB/data/m_temp_Hopfield_out.txt"
Private strFileNameIn As String
Private strFileNameOut As String

                     
Private Sub cmdLoad_Click()

    Dim strPath As String
    Dim intFileNr As Integer
    Dim strLine As String
    
    On Error GoTo ErrHandler
    cmnPath.ShowOpen
    
    intFileNr = FreeFile
    strPath = cmnPath.fileName
    strFileNameIn = cmnPath.fileName

    Open strPath For Input As intFileNr
    
    Line Input #intFileNr, strLine
    txtAlfa.Text = Val(Right(strLine, Len(strLine) - Len(c_strAlfa) - 1))
    txtAlfaCritPct.Text = Format(Val(txtAlfa.Text) / c_dblAlfaCritical * 100, "0")
    sclAlfa.Value = Val(txtAlfa.Text)
    Line Input #intFileNr, strLine
    txtDeviation.Text = Val(Right(strLine, Len(strLine) - Len(c_strDeviation) - 1))
    sclDeviation.Value = Val(txtDeviation.Text) * 100
    Line Input #intFileNr, strLine
    txtN.Text = Right(strLine, Len(strLine) - Len(c_strN) - 1)
    Line Input #intFileNr, strLine
    txtMaxNrIterations.Text = Right(strLine, Len(strLine) - Len(c_strMaxNrIterations) - 1)
    Line Input #intFileNr, strLine
    optUpdateAsynch.Value = IIf(Right(strLine, Len(strLine) - Len(c_strUpdateAsynch) - 1) = "1", True, False)
    optUpdateSynch.Value = Not (optUpdateAsynch.Value)
    Line Input #intFileNr, strLine
    txtXMin.Text = Right(strLine, Len(strLine) - Len(c_strXMin) - 1)
    Line Input #intFileNr, strLine
    txtXMax.Text = Right(strLine, Len(strLine) - Len(c_strXMax) - 1)
    Line Input #intFileNr, strLine
    txtDimX.Text = Right(strLine, Len(strLine) - Len(c_strDimX) - 1)
  
    Close intFileNr

ErrHandler:
    
End Sub

Private Sub cmdPlot_Click()
    Dim returnValue As Integer
    privateSave (False)
    returnValue = m_temp_Hopfield(c_strFileNameIn, c_strFileNameOut)
End Sub

Private Sub privateSave(blnWithDialogue As Boolean)

    Dim strPath As String
    Dim intFileNr As Integer
    Dim strLine As String
    
    On Error GoTo ErrHandler
    If (blnWithDialogue) Then
        cmnPath.ShowSave
        intFileNr = FreeFile
        strPath = cmnPath.fileName
        strFileNameIn = cmnPath.fileName
        Else
        strPath = c_strFileNameIn
    End If
    
    Open strPath For Output As intFileNr
    
    Print #intFileNr, "alfa "; txtAlfa.Text
    Print #intFileNr, "deviation "; txtDeviation.Text
    Print #intFileNr, "N "; txtN.Text
    Print #intFileNr, "maxNrIterations "; txtMaxNrIterations.Text
    Print #intFileNr, "updateAsynch "; IIf(optUpdateAsynch.Value, "1", "0")
    Print #intFileNr, "xMin "; txtXMin.Text
    Print #intFileNr, "xMax "; txtXMax.Text
    Print #intFileNr, "dimX "; txtDimX.Text
    
    Close intFileNr

ErrHandler:
    
End Sub

Private Sub cmdSave_Click()

    privateSave (True)
    
End Sub

Private Sub Form_Load()
    strFileNameIn = c_strFileNameIn
    strFileNameOut = c_strFileNameOut
End Sub



Private Sub sclDeviation_Change()
    txtDeviation.Text = sclDeviation.Value / 100
End Sub
Private Sub sclAlfa_Change()
    txtAlfa.Text = sclAlfa.Value / 100
    txtAlfaCritPct = Format(sclAlfa.Value / c_dblAlfaCritical, "0")
End Sub

Private Sub txtAlfa_GotFocus()
    txtAlfa.SelStart = 0
    txtAlfa.SelLength = Len(txtAlfa.Text)
End Sub

Private Sub txtAlfa_LostFocus()
    If Val(txtAlfa.Text) < 0 Then txtAlfa.Text = 0
    If Val(txtAlfa.Text) > 1 Then txtAlfa.Text = 1
    sclAlfa.Value = Val(txtAlfa.Text) * 100
    txtAlfaCritPct = Format(sclAlfa.Value / c_dblAlfaCritical, "0")
End Sub

Private Sub txtDeviation_GotFocus()
    txtDeviation.SelStart = 0
    txtDeviation.SelLength = Len(txtDeviation.Text)
End Sub

Private Sub txtDeviation_LostFocus()
    If Val(txtDeviation.Text) < 0 Then txtDeviation.Text = 0
    If Val(txtDeviation.Text) > 1 Then txtDeviation.Text = 1
    sclDeviation.Value = Val(txtDeviation.Text) * 100
End Sub

Private Sub txtN_GotFocus()
    txtN.SelStart = 0
    txtN.SelLength = Len(txtN.Text)
End Sub
Private Sub txtMaxNrIterations_GotFocus()
    txtMaxNrIterations.SelStart = 0
    txtMaxNrIterations.SelLength = Len(txtMaxNrIterations.Text)
End Sub
Private Sub txtXMax_GotFocus()
    txtXMax.SelStart = 0
    txtXMax.SelLength = Len(txtXMax.Text)
End Sub
Private Sub txtXMin_GotFocus()
    txtXMin.SelStart = 0
    txtXMin.SelLength = Len(txtXMin.Text)
End Sub
Private Sub txtDimX_GotFocus()
    txtDimX.SelStart = 0
    txtDimX.SelLength = Len(txtDimX.Text)
End Sub



