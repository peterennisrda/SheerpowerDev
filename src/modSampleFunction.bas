' Copyright FMS, Inc.  All Rights Reserved.
' Permission for use granted to members of MyFMS (membership is FREE)
'
' Sample code for the FMS Technical Paper on Query Tips and Techniques
' written by Luke Chung, President of FMS, Inc.
' Full details at http://www.fmsinc.com/tpapers/queries/

Option Compare Database
Option Explicit

Public Function StripLead(pstrPhrase As String) As String
  ' Comments: Get rid of leading A, An, or The in a phrase.
  '           Used for card catalog sorting.
  ' In      : pstrPhrase        Phrase to examine
  ' Returns : The input phrase without the "useless" first word.
  '           Returns the same phrase if the first word isn't an issue

  Dim strFirstWord As String
  Dim strReturn As String
  Dim intPos As Integer
  
  strReturn = pstrPhrase
  intPos = InStr(pstrPhrase, " ")
  If intPos > 0 Then
    strFirstWord = Left$(pstrPhrase, intPos - 1)
    Select Case strFirstWord
      Case "A", "An", "The"
        strReturn = Right$(pstrPhrase, Len(pstrPhrase) - intPos)
    End Select
  End If
  StripLead = strReturn
End Function