Option Compare Database
Option Explicit

Public Function RemoveIllegalCharacters(ByVal strText As String) As String

    ' Ref: https://access-programmers.co.uk/forums/showthread.php?t=261147

    Const cstrIllegals As String = "\,/,:,*,?,"",<,>,|"
    
    'Debug.Print cstrIllegals

    Dim lngCounter As Long
    Dim astrChars() As String

    astrChars() = Split(cstrIllegals, ",")

    For lngCounter = LBound(astrChars()) To UBound(astrChars())
        strText = Replace(strText, astrChars(lngCounter), vbNullString)
    Next lngCounter

    RemoveIllegalCharacters = strText

    Debug.Print RemoveIllegalCharacters

End Function