VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{65E121D4-0C60-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCHRT20.OCX"
Begin VB.Form frmBEGMvsAlfa 
   Caption         =   "     BEG: m vs alfa"
   ClientHeight    =   4935
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   13500
   Icon            =   "frmBEGMvsAlfa.frx":0000
   LinkTopic       =   "Form1"
   MDIChild        =   -1  'True
   ScaleHeight     =   4935
   ScaleWidth      =   13500
   Begin VB.Frame Frame4 
      Caption         =   "Plot"
      Height          =   4875
      Left            =   6480
      TabIndex        =   27
      Top             =   0
      Width           =   6900
      Begin MSChart20Lib.MSChart MSChart1 
         Height          =   4560
         Left            =   90
         OleObjectBlob   =   "frmBEGMvsAlfa.frx":014A
         TabIndex        =   28
         Top             =   225
         Width           =   6735
      End
   End
   Begin VB.Frame Frame5 
      Caption         =   "Deviation of the beginstate from the target"
      Height          =   780
      Index           =   1
      Left            =   225
      TabIndex        =   0
      Top             =   2115
      Width           =   4245
      Begin VB.TextBox txtDeviation 
         Height          =   285
         Left            =   900
         TabIndex        =   2
         Text            =   "0.1"
         Top             =   300
         Width           =   465
      End
      Begin VB.HScrollBar sclDeviation 
         Height          =   240
         Left            =   1665
         Max             =   100
         TabIndex        =   1
         Top             =   360
         Value           =   10
         Width           =   2310
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Parameters"
      Height          =   4875
      Left            =   45
      TabIndex        =   3
      Top             =   0
      Width           =   6360
      Begin VB.Frame Frame5 
         Caption         =   "Number of possible spins"
         Height          =   855
         Index           =   0
         Left            =   180
         TabIndex        =   23
         Top             =   2970
         Width           =   4275
         Begin VB.OptionButton optQis3 
            Caption         =   "3"
            Height          =   255
            Left            =   1560
            TabIndex        =   25
            Top             =   360
            Value           =   -1  'True
            Width           =   495
         End
         Begin VB.OptionButton optQis2 
            Caption         =   "2"
            Height          =   315
            Left            =   840
            TabIndex        =   24
            Top             =   330
            Width           =   495
         End
         Begin VB.Label Label9 
            Caption         =   "Q :"
            Height          =   255
            Left            =   240
            TabIndex        =   26
            Top             =   360
            Width           =   255
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Size"
         Height          =   735
         Left            =   180
         TabIndex        =   20
         Top             =   225
         Width           =   4245
         Begin VB.TextBox txtN 
            Height          =   285
            Left            =   900
            TabIndex        =   21
            Text            =   "1000"
            Top             =   270
            Width           =   960
         End
         Begin VB.Label Label6 
            Caption         =   "neurons"
            Height          =   240
            Left            =   1935
            TabIndex        =   22
            Top             =   315
            Width           =   1005
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "Update"
         Height          =   915
         Left            =   180
         TabIndex        =   17
         Top             =   1080
         Width           =   4245
         Begin VB.OptionButton optUpdateSynch 
            Caption         =   "Synchronously"
            Height          =   240
            Left            =   900
            TabIndex        =   19
            Top             =   540
            Width           =   1590
         End
         Begin VB.OptionButton optUpdateAsynch 
            Caption         =   "Asynchronously"
            Height          =   285
            Left            =   900
            TabIndex        =   18
            Top             =   225
            Value           =   -1  'True
            Width           =   1545
         End
      End
      Begin VB.Frame Frame8 
         Caption         =   "Alfa"
         Height          =   1725
         Left            =   4590
         TabIndex        =   10
         Top             =   225
         Width           =   1545
         Begin VB.TextBox txtXMin 
            Height          =   285
            Left            =   765
            TabIndex        =   13
            Text            =   "0"
            Top             =   315
            Width           =   555
         End
         Begin VB.TextBox txtXMax 
            Height          =   285
            Left            =   765
            TabIndex        =   12
            Text            =   "0.12"
            Top             =   675
            Width           =   555
         End
         Begin VB.TextBox txtDimX 
            Height          =   315
            Left            =   300
            TabIndex        =   11
            Text            =   "100"
            Top             =   1260
            Width           =   1035
         End
         Begin VB.Label Label4 
            Caption         =   "Min :"
            Height          =   195
            Index           =   0
            Left            =   180
            TabIndex        =   16
            Top             =   315
            Width           =   420
         End
         Begin VB.Label Label7 
            Caption         =   "Max :"
            Height          =   195
            Left            =   180
            TabIndex        =   15
            Top             =   675
            Width           =   465
         End
         Begin VB.Label Label8 
            Caption         =   "# Samples :"
            Height          =   240
            Left            =   180
            TabIndex        =   14
            Top             =   1035
            Width           =   1050
         End
      End
      Begin VB.CommandButton cmdPlot 
         Caption         =   "Plot"
         Height          =   330
         Left            =   4815
         TabIndex        =   9
         Top             =   4320
         Width           =   1140
      End
      Begin VB.CommandButton cmdLoad 
         Caption         =   "Load"
         Height          =   330
         Left            =   4815
         TabIndex        =   8
         Top             =   3465
         Width           =   1140
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "Save"
         Height          =   330
         Left            =   4815
         TabIndex        =   7
         Top             =   3885
         Width           =   1140
      End
      Begin VB.Frame Frame3 
         Caption         =   "Maximum"
         Height          =   735
         Left            =   180
         TabIndex        =   4
         Top             =   3930
         Width           =   4290
         Begin VB.TextBox txtMaxNrIterations 
            Height          =   285
            Left            =   900
            TabIndex        =   5
            Text            =   "10000"
            Top             =   300
            Width           =   780
         End
         Begin VB.Label Label5 
            Caption         =   "iterations"
            Height          =   240
            Left            =   1755
            TabIndex        =   6
            Top             =   315
            Width           =   960
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
End
Attribute VB_Name = "frmBEGMvsAlfa"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
                    
Private Declare Function m_alfa_BEG _
      Lib "D:\ANN_VB\ann.dll" _
                     (ByVal nameIn As String, ByVal nameOut As String) _
                     As Integer
                     
Private Declare Function test _
      Lib "D:\ANN_VB\ann.dll" _
                     (ByVal name As String, ByRef alfa As Long, ByRef N As Integer) _
                     As Integer
                     
Private Const c_strDefaultOut As String = "D:\ANN_VB\defaultData\m_alfa_BEG_out.txt"
Private Const c_strFileNameIn As String = "D:\ANN_VB\data\m_alfa_BEG_in.txt"
Private Const c_strFileNameOut As String = "D:\ANN_VB\data\m_alfa_BEG_out.txt"
                     
Private Sub pvtLoadParam(strPath As String)
    Dim intFileNr As Integer
    Dim strLine As String
    intFileNr = FreeFile

    Open strPath For Input As intFileNr
    
    Line Input #intFileNr, strLine
    optQis3.Value = IIf(Right(strLine, Len(strLine) - Len(c_strQ) - 1) = "3", True, False)
    optQis2.Value = Not (optQis3.Value)
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

End Sub

Private Sub cmdLoad_Click()
    Dim strPath As String
    On Error GoTo ErrHandler
        cmnPath.ShowOpen
        strPath = cmnPath.FileName
        pvtLoadParam (strPath)
ErrHandler:
End Sub

Private Sub cmdPlot_Click()
    Dim returnValue As Integer
    pvtSave (False)
    returnValue = m_alfa_BEG(c_strFileNameIn, c_strFileNameOut)
    If (returnValue > 0) Then
        ChartIt (c_strFileNameOut)
    Else
        MsgBox "Unexpected result during calculations"
    End If
End Sub


Private Sub ChartIt(strFileName As String)

    Dim intNrData As Integer
    Dim intNrSeries As Integer
    Dim intCurSeries As Integer
        
    intNrSeries = 1
    intCurSeries = 1
    
    Dim arrChartPoints() As Double
    arrChartPoints = Get2DArray(strFileName)
    'see what the number of data is for the first series
    intNrData = 100
    MSChart1.RowCount = intNrData
    'We need to increase the ColumnCount. For X-Y Scatter graphs, we
    'need 2 columns for each series.
    MSChart1.ColumnCount = intCurSeries * 2
    MSChart1.ColumnLabelCount = intCurSeries * 2
    
    MSChart1.Column = intCurSeries * 2 - 1
    MSChart1.ColumnLabel = "Series " & Str(intCurSeries)
    
    MSChart1.Plot.UniformAxis = False
   ' MSChart1.Footnote.Text = "Footnote goes here"
    
    'Set white as the backgroundcolour of the chart
    MSChart1.Plot.Wall.Brush.Style = VtBrushStyleSolid
'   Color is already white by default
'   MSChart1.Plot.Wall.Brush.FillColor.Set 255, 255, 255
                  
    'Select wether you want markers and or a line connecting the data points
    MSChart1.Plot.SeriesCollection.Item(intCurSeries * 2 - 1).SeriesMarker.Show = True
    MSChart1.Plot.SeriesCollection.Item(intCurSeries * 2 - 1).ShowLine = False
    
    'Create the plot points for this series from the arrChartPoints array:
    Dim intRow As Integer
    For intRow = 1 To intNrData
        MSChart1.DataGrid.SetData intRow, intCurSeries * 2 - 1, arrChartPoints(1, intRow), False
        MSChart1.DataGrid.SetData intRow, intCurSeries * 2, arrChartPoints(2, intRow), False
    Next
    
    'Remove null points from *this* series, if it has *fewer*
    MSChart1.Refresh
SubExit:
    MousePointer = 0
End Sub

'Private Sub pvtCheckInt(strValue As String, intMin As Integer, intMax As Integer)
'    If ((Val(strValue) < intMin) Or (Val(strValue) > intMax)) Then
'        Dim strValueNew As String
'        strValueNew = InputBox("Enter a valid integer between ", "Error in input")
'        strValue = strValueNew
'    End If
'End Sub

Private Sub pvtSave(blnWithDialogue As Boolean)

    Dim strPath As String
    Dim intFileNr As Integer
    Dim strLine As String
    
    intFileNr = FreeFile
    On Error GoTo ErrHandler
    If (blnWithDialogue) Then
        cmnPath.ShowSave
        strPath = cmnPath.FileName
    Else
        strPath = c_strFileNameIn
    End If
    
    Open strPath For Output As intFileNr
    
    Print #intFileNr, "Q "; IIf(optQis3.Value, "3", "2")
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
    pvtSave (True)
End Sub

Private Sub Form_Load()
    If Dir$("D:\ANN_VB\ann.dll") = "" Then
        MsgBox "The DLL could not be loaded!"
    End If

    If Dir$(c_strFileNameIn) = "" Then
        MsgBox "The InputFile could not be loaded!"
    End If
    
    If Dir$(c_strFileNameOut) = "" Then
        MsgBox "The InputFile could not be loaded!"
    End If
    
    pvtLoadParam (c_strDefaultOut)
    ChartIt (c_strDefaultOut)
    'Give the frame the right dimensions and position
    Me.Move 0, 0, 13620, 6045
End Sub

Private Sub sclDeviation_Change()
    txtDeviation = sclDeviation.Value / 100
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

Private Sub txtDimX_GotFocus()
    txtDimX.SelStart = 0
    txtDimX.SelLength = Len(txtDimX.Text)
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










