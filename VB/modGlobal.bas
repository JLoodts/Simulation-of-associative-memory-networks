Attribute VB_Name = "modGlobal"
Option Explicit

Public Const c_strAlfa As String = "alfa"
Public Const c_strDeviation As String = "deviation"
Public Const c_strN As String = "N"
Public Const c_strQ As String = "Q"
Public Const c_strB As String = "b"
Public Const c_strMaxNrIterations As String = "maxNrIterations"
Public Const c_strUpdateAsynch As String = "updateAsynch"
Public Const c_strTemp As String = "temp"
Public Const c_strNrData As String = "nrData"
Public Const c_strXMin As String = "xMin"
Public Const c_strXMax As String = "xMax"
Public Const c_strDimX As String = "dimX"
Public Const c_strYMin As String = "yMin"
Public Const c_strYMax As String = "yMax"
Public Const c_strDimY As String = "dimY"

Public Const c_dblAlfaCritical As Double = 0.138
Public Const c_intFrameHeight As Integer = 5340
Public Const c_intFrameWidth As Integer = 13620
'Public Const c_strPathToDLL As String = "D:\Thesis\ANNDLL02\release\ann.dll"



Public Function Get2DArray(strFileName As String) As Double()
    Dim intFileNr As Integer
    Dim arrdblValues() As Double
    Dim strLine As String
    
    intFileNr = FreeFile
    Open strFileName For Input As intFileNr
    Line Input #intFileNr, strLine
    
    Dim dblX As Double
    Dim dblY As Double
    Dim strx As String
    Dim intPositie As Integer
    Dim intTeller As Integer
    intTeller = 1
    
    'Skip all the lines describing the parameters
    Line Input #intFileNr, strLine
    While ((InStr(1, strLine, "data_begin", vbTextCompare) = 0) And (Not EOF(intFileNr)))
        Line Input #intFileNr, strLine
    Wend
    
    While Not EOF(intFileNr)
        Line Input #intFileNr, strLine
        intPositie = InStr(1, strLine, " ", vbTextCompare)
        If intPositie <> 0 Then
            dblX = Val(Left(strLine, intPositie - 1))
            dblY = Val(Right(strLine, Len(strLine) - intPositie))
            ReDim Preserve arrdblValues(1 To 2, 1 To intTeller)
            arrdblValues(1, intTeller) = dblX
            arrdblValues(2, intTeller) = dblY
            intTeller = intTeller + 1
        End If
    Wend

    Close intFileNr
    Get2DArray = arrdblValues
End Function

Public Function Get3DArray(strFileName As String, intNrColumns As Integer, intNrRows As Integer) As Double()
    Dim intFileNr As Integer
    Dim arrdblValues() As Double
    Dim strLine As String
    
    intFileNr = FreeFile
    Open strFileName For Input As intFileNr
    Line Input #intFileNr, strLine
    
    Dim dblX As Double
    Dim dblY As Double
    Dim strx As String
    Dim intPositionOld As Integer
    Dim intPositie As Integer
    Dim intTeller As Integer
    Dim intColumn As Integer
 
    'Find the dimensions of the array
    Line Input #intFileNr, strLine
    While ((InStr(1, strLine, c_strDimX, vbTextCompare) = 0) And (Not EOF(intFileNr)))
        Line Input #intFileNr, strLine
    Wend
    intNrRows = Val(Right(strLine, Len(strLine) - Len(c_strDimX) - 1))
    Line Input #intFileNr, strLine
    While ((InStr(1, strLine, c_strDimY, vbTextCompare) = 0) And (Not EOF(intFileNr)))
        Line Input #intFileNr, strLine
    Wend
    intNrColumns = Val(Right(strLine, Len(strLine) - Len(c_strDimX) - 1))
    'Adjust the size of arrdblValues
    ReDim arrdblValues(1 To 2 * intNrColumns, 1 To intNrRows)
    
    'Skip all the lines describing the parameters
    Line Input #intFileNr, strLine
    While ((InStr(1, strLine, "data_begin", vbTextCompare) = 0) And (Not EOF(intFileNr)))
        Line Input #intFileNr, strLine
    Wend
    
    intColumn = 1
    While ((Not EOF(intFileNr)) And (intColumn <= intNrColumns))
        Line Input #intFileNr, strLine
        intPositionOld = 1
        intTeller = 1
        intPositie = InStr(intPositionOld, strLine, " ", vbTextCompare)
        While ((intPositie <> 0) And intTeller <= intNrRows)
            dblX = Val(Mid(strLine, intPositionOld, intPositie - intPositionOld))
            intPositionOld = intPositie + 1
            intPositie = InStr(intPositionOld, strLine, " ", vbTextCompare)
            If (intPositie <> 0) Then
                dblY = Val(Mid(strLine, intPositionOld, intPositie - intPositionOld))
                intPositionOld = intPositie + 1
                intPositie = InStr(intPositionOld, strLine, " ", vbTextCompare)
            End If
            
            arrdblValues(2 * intColumn - 1, intTeller) = dblX
            arrdblValues(2 * intColumn, intTeller) = dblY
            intTeller = intTeller + 1
            
        Wend
        intColumn = intColumn + 1
    Wend

  
    Close intFileNr
    Get3DArray = arrdblValues
End Function

Public Function GetArrayLvsM(strFileName As String, intNrColumns As Integer, intNrRows As Integer) As Double()
    Dim intFileNr As Integer
    Dim arrdblValues() As Double
    Dim strLine As String
    
    intFileNr = FreeFile
    Open strFileName For Input As intFileNr
    Line Input #intFileNr, strLine
    
    Dim dblX As Double
    Dim dblY As Double
    Dim strx As String
    Dim intPositionOld As Integer
    Dim intPositie As Integer
    Dim intTeller As Integer
    Dim intColumn As Integer
    Dim intDimX As Integer
    Dim intDimY As Integer
 
    'Find the dimensions of the array
    Line Input #intFileNr, strLine
    While ((InStr(1, strLine, c_strNrData, vbTextCompare) = 0) And (Not EOF(intFileNr)))
        Line Input #intFileNr, strLine
    Wend
    intNrRows = Val(Right(strLine, Len(strLine) - Len(c_strNrData) - 1))
    Line Input #intFileNr, strLine
    While ((InStr(1, strLine, c_strDimX, vbTextCompare) = 0) And (Not EOF(intFileNr)))
        Line Input #intFileNr, strLine
    Wend
    intDimX = Val(Right(strLine, Len(strLine) - Len(c_strDimX) - 1))
    Line Input #intFileNr, strLine
    While ((InStr(1, strLine, c_strDimY, vbTextCompare) = 0) And (Not EOF(intFileNr)))
        Line Input #intFileNr, strLine
    Wend
    intDimY = Val(Right(strLine, Len(strLine) - Len(c_strDimY) - 1))
    'Adjust the size of arrdblValues
    intNrColumns = intDimX * intDimY
    ReDim arrdblValues(1 To 2 * intNrColumns, 1 To intNrRows)
    
    'Skip all the lines describing the parameters
    Line Input #intFileNr, strLine
    While ((InStr(1, strLine, "data_begin", vbTextCompare) = 0) And (Not EOF(intFileNr)))
        Line Input #intFileNr, strLine
    Wend
    
    intColumn = 1
    While ((Not EOF(intFileNr)) And (intColumn <= intNrColumns))
        Line Input #intFileNr, strLine
        intPositionOld = 1
        intTeller = 1
        intPositie = InStr(intPositionOld, strLine, " ", vbTextCompare)
        While ((intPositie <> 0) And intTeller <= intNrRows)
            dblX = Val(Mid(strLine, intPositionOld, intPositie - intPositionOld))
            intPositionOld = intPositie + 1
            intPositie = InStr(intPositionOld, strLine, " ", vbTextCompare)
            If (intPositie <> 0) Then
                dblY = Val(Mid(strLine, intPositionOld, intPositie - intPositionOld))
                intPositionOld = intPositie + 1
                intPositie = InStr(intPositionOld, strLine, " ", vbTextCompare)
            End If
            
            arrdblValues(2 * intColumn - 1, intTeller) = dblX
            arrdblValues(2 * intColumn, intTeller) = dblY
            intTeller = intTeller + 1
            
        Wend
        intColumn = intColumn + 1
    Wend

  
    Close intFileNr
    GetArrayLvsM = arrdblValues
End Function

