#Declaracion-de-variables
[string]$stropcion = ""
[int]$intopcion = 0
[string]$raiz = "c:\temp\iric700\"#crear carpeta en esta ubicacion
[string]$raiztwo = "c:\temp\iric700\"#crear carpeta en esta ubicacion
[string]$resp = ""
[string]$strcarpeta = ""
[int]$intcarpeta = 0
[string]$strnuevonombrecarpeta = ""
[string]$strnuevonombrearchivo = ""
[string]$strseleccioncarpeta = ""

#Se crea ciclo
do{
    #Mostar menu
    Write-Host "1)Crear directorio"
    Write-Host "2)Crear archivo"
    Write-Host "3)Borrar directorio"
    Write-Host "4)Borrar archivo"
    Write-Host "5)Renombrar directorio"
    Write-Host "6)Renombrar archivo"
    Write-Host "7)Mover directorio"
    Write-Host "8)Mover archivo"
    Write-Host "9)Copiar directorio"
    Write-Host "10)Copiar archivo"
    Write-Host "11)salir"
    #Leer opcion en cadena
    $stropcion = Read-Host "Ingresa un valor del 1 al 11"
    #Convierte a entero
    [bool]$result = [int]::TryParse($stropcion,[ref]$intopcion)

    if ($result) { 
        if ($intopcion -eq 11)
        {
            break
        } else {
            switch($intopcion) {
            #Crear directorio
            1 {
                do{
                    $directorio = Read-Host "Ingresa el nombre del directorio que quieres crear" 
                    $ruta = $raiz + $directorio
                    if (Test-Path $ruta) {
                        Write-Host "Directorio ya existe"
                         do { 
                            $resp = Read-Host "Deseas interntarlo nuevamente [S/N]: "
                            if (($resp.ToUpper() -eq "S") -or ($resp.ToUpper() -eq "N")){
                                break
                                }
                            }while ($true)
                            if ($resp.ToUpper() -eq "N"){
                                break
                               }
                             }else{
                              New-Item -Path $ruta -ItemType 'directory'
                                    break
                                }
                            }while ($true)
                        }

            #Crear archivo
            2 {
                #listar carpetas
                Write-Host "*** Ha elegido la opcion de crear archivo ***"                
                    $listado = Get-ChildItem $raiz
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado) {
                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                    }
                    
                    do{
                        $carpeta = Read-Host "Ingresa el nombre del directorio donde desea crear el archivo"                        
                        $strseleccioncarpeta = $raiz +$carpeta                       
                        #111
                        if (Test-Path $strseleccioncarpeta) {
                        do{
                           
                         #listar archivos
                            $listado = Get-ChildItem $newruta
                            [int]$cont = 0
                            [string]$elemento = ""
                            foreach ($element in $listado) {
                                if ($element.GetType().Name.Equals('FileInfo')) {
                                    $cont++     
                                    $elemento = $cont.ToString() + ") " + $element.Name 

                                    write-host $elemento                                            
                                }
                            }
                            #seleccionar archivo seleccionado
                            do{
                                $strfileselect = Read-Host "Ingresa el nombre del archivo que quieres crear"
                                Write-Host "ha elegido la carpeta: "$strfileselect
                                $strnewfile = $newruta + "\"+ $strfileselect
                                if (Test-Path $strnewfile) {
                                   Write-Host "Archivo ya existe"
                                   do {
                                   $resp = Read-Host "Desea intentarlo nuevamente [S/N]:"
                                   if (($resp.ToUpper() -eq"S") -or($resp.ToUpper() -eq"N")) {
                                       break
                                      }
                                    } while ($true)
                                    if ($resp.ToUpper() -eq"N") {
                                        break
                                    }
                                    }else{
                                     New-Item -Path $strnewfile -ItemType 'File'
                                     Write-Host "Se creo el archivo: " $strfileselect
                                     Write-Host "En la ubicacion: " $newruta
                                     break
                                }
                             }while ($true)
                             break                        
                        #22
                                }while ($true)
                                break
                            }else{
                            write-host "el directorio no existe"
                              do {
                           $resp = Read-Host "Desea intentarlo nuevamente [S/N]:"
                           if (($resp.ToUpper() -eq"S") -or($resp.ToUpper() -eq"N")) {
                               break
                              }
                            } while ($true)
                            if ($resp.ToUpper() -eq"N") {
                                break
                            }
                        }
                     }while ($true)
                      
                 }

            #Borrar directorio
            3 {
                    $listado = Get-ChildItem $raiz
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado){
                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                        }                
                do{
                    
                    $directorio = Read-Host "Ingresa el nombre del directorio que quieres borrar" 
                    $ruta = $raiz + $directorio 
                     if (Test-Path $ruta) {
                     Write-Host "Directorio ya fue eliminado"      
                         do { 
                           Remove-Item -Path $ruta -Recurse
                           break
                           }while ($true)
                           break
                           }elif{
                           Write-Host "El directorio no exixte" 
                           
                           do{
                            $resp = Read-Host "Deseas borrar otro directorio [S/N]: "
                            if (($resp.ToUpper() -eq "S") -or ($resp.ToUpper() -eq "N")){
                                break
                                }
                            }while ($true)
                            if ($resp.ToUpper() -eq "N"){
                                break
                               }
                               
                             }
                            }while ($true)
                 }

            #Borrar archivo terminado
            4 {
                #listar carpetas
                Write-Host "*** Ha elegido la opcion de borrar archivo ***"                
                    $listado = Get-ChildItem $raiz
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado) {
                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                    }
                    
                    do{
                        $carpeta = Read-Host "Ingresa el nombre del directorio donde esta el archivo que quieres borrar"                        
                        $strseleccioncarpeta = $raiz +$carpeta
                        if (Test-Path $strseleccioncarpeta) {
                        do{
                           Write-Host "ha elegido la carpeta: " $strseleccioncarpeta
                    $newruta = $strseleccioncarpeta
                 #listar archivos
                    $listado = Get-ChildItem $newruta
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado) {
                        if ($element.GetType().Name.Equals('FileInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                    }
                    #borrar archivo seleccionado
                    do{
                        $strfileselect = Read-Host "Ingresa el nombre del archivo que quieres borrar"
                        Write-Host "ha elegido la carpeta: "$strfileselect
                        $strfileremove =$newruta + "/"+ $strfileselect
                        if (Test-Path $strfileremove) {
                         do { 
                           Remove-Item -Path $strfileremove -Recurse                           
                           Write-Host "el archivo fue eliminado"
                           break
                           }while ($true)
                           break
                           }
                           else{
                           Write-Host "El archivo no existe" 
                           do{
                            $resp = Read-Host "Deseas borrar otro archivo [S/N]: "
                            if (($resp.ToUpper() -eq "S") -or ($resp.ToUpper() -eq "N")){
                                break
                                }
                            }while ($true)
                            if ($resp.ToUpper() -eq "N"){
                                break
                               }
                             }      
                        }while ($true)
                        break
                       
                                }while ($true)
                                break
                            }else{
                            write-host "el directorio no existe"
                              do {
                           $resp = Read-Host "Desea intentarlo nuevamente [S/N]:"
                           if (($resp.ToUpper() -eq"S") -or($resp.ToUpper() -eq"N")) {
                               break
                              }
                            } while ($true)
                            if ($resp.ToUpper() -eq"N") {
                                break
                            }
                        }
                     }while ($true)
                      
                 }

            #Renombrar directorio
            5 { 
                    Write-Host "Elija el directorio que desea renombrar"
                    $listado = Get-ChildItem $raiz
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado){
                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                        }
                #inicio do
                    do{
                        $directorio = Read-Host "Ingresa el nombre del directorio que quieres renombrar" 
                        Write-Host "El directorio elegido es: " $directorio
                        $ruta = $raiz + $directorio 
                        if (Test-Path $ruta) {      
                         do { 
                           $strnuevonombrecarpeta = Read-Host "Ingrese el nuevo nombre"
                           Rename-Item $ruta -NewName $strnuevonombrecarpeta
                           Write-Host "El nuevo nombre es: "$strnuevonombrecarpeta
                           break
                           }while ($true)
                           break
                           }
                           else{
                           Write-Host "El directorio no existe" 
                           do{
                            $resp = Read-Host "Deseas renombrar otro directorio [S/N]: "
                            if (($resp.ToUpper() -eq "S") -or ($resp.ToUpper() -eq "N")){
                                break
                                }
                            }while ($true)
                            if ($resp.ToUpper() -eq "N"){
                                break
                               }
                             }      
                        }while ($true)
              
                } 

            #Renombrar archivo terminado
            6 {
                #listar carpetas
                Write-Host "*** Ha elegido la opcion de renombrar archivo ***"                
                    $listado = Get-ChildItem $raiz
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado) {
                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                    }
                    
                    do{
                        $carpeta = Read-Host "Ingresa el nombre del directorio donde esta el archivo que quieres renombrar"
                        #Write-Host "ha elegido la carpeta: "$strseleccioncarpeta
                        $strseleccioncarpeta = $raiz +$carpeta
                        if (Test-Path $strseleccioncarpeta) {
                        do{
                           
                        #11  
                        Write-Host "ha elegido la carpeta: " $strseleccioncarpeta
                            $newruta = $strseleccioncarpeta
                         #listar archivos
                            $listado = Get-ChildItem $newruta
                            [int]$cont = 0
                            [string]$elemento = ""
                            foreach ($element in $listado) {
                                if ($element.GetType().Name.Equals('FileInfo')) {
                                    $cont++     
                                    $elemento = $cont.ToString() + ") " + $element.Name 

                                    write-host $elemento                                            
                                }
                            }
                            #borrar archivo seleccionado
                            do{
                                $strfileselect = Read-Host "Ingresa el nombre del archivo que quieres renombrar"
                                Write-Host "ha elegido la carpeta: "$strfileselect
                                $strfilerename =$newruta + "/"+ $strfileselect
                                if (Test-Path $strfilerename) {
                                 do { 
                                   $strnuevonombrearchivo = Read-Host "Ingrese el nuevo nombre"
                                   Rename-Item $strfilerename -NewName $strnuevonombrearchivo
                                   Write-Host "El nuevo nombre es: "$strnuevonombrearchivo
                                   break
                                   }while ($true)
                                   break
                                   }
                                   else{
                                   Write-Host "El archivo no existe" 
                                   do{
                                    $resp = Read-Host "Deseas renombrar otro archivo [S/N]: "
                                    if (($resp.ToUpper() -eq "S") -or ($resp.ToUpper() -eq "N")){
                                        break
                                        }
                                    }while ($true)
                                    if ($resp.ToUpper() -eq "N"){
                                        break
                                       }
                                     }      
                                }while ($true)
                                break

                        }while ($true)
                        break
                          #22
                            }else{
                            write-host "el directorio no existe"
                              do {
                           $resp = Read-Host "Desea intentarlo nuevamente [S/N]:"
                           if (($resp.ToUpper() -eq"S") -or($resp.ToUpper() -eq"N")) {
                               break
                              }
                            } while ($true)
                            if ($resp.ToUpper() -eq"N") {
                                break
                            }
                        }
                     }while ($true)
                      break
                 }  

            #Mover directorio
            7 {
                    Write-Host "Elija el directorio que desea mover"
                    $listado = Get-ChildItem $raiz
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado){
                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                        }
                #inicio do
                    do{
                        $directorio = Read-Host "Ingresa el nombre del directorio que quieres Mover" 
                        Write-Host "El directorio elegido es: " $directorio
                        $newruta = $raiz + $directorio
                        
                        if (Test-Path $newruta) {      
                         do { 

                           
                           Move-Item -path $newruta -destination $raiztwo
                           Write-Host "se ha movido el directorio: "$newruta "a la ubicación c:/temp/iric7017"



                           break
                           }while ($true)
                           break
                           }
                           else{
                           Write-Host "El directorio no exixte" 
                           do{
                            $resp = Read-Host "Deseas renombrar otro directorio [S/N]"
                            if (($resp.ToUpper() -eq "S") -or ($resp.ToUpper() -eq "N")){
                                break
                                }
                            }while ($true)
                            if ($resp.ToUpper() -eq "N"){
                                break
                               }
                             }      
                        }while ($true)
               
    
                }

            #Mover archivo terminado
            8 {
                #listar carpetas
                Write-Host "*** Ha elegido la opcion de mover archivo ***"                
                    $listado = Get-ChildItem $raiz
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado) {
                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                    }
                    
                    do{
                        $carpeta = Read-Host "Ingresa el nombre del directorio donde esta el archivo que quieres mover"                        
                        $strseleccioncarpeta = $raiz +$carpeta
                        if (Test-Path $strseleccioncarpeta) {
                        do{
                           
                        #11  
                        Write-Host "ha elegido la carpeta: " $strseleccioncarpeta
                            $newruta =$strseleccioncarpeta
                         #listar archivos
                            $listado = Get-ChildItem $newruta
                            [int]$cont = 0
                            [string]$elemento = ""
                            foreach ($element in $listado) {
                                if ($element.GetType().Name.Equals('FileInfo')) {
                                    $cont++     
                                    $elemento = $cont.ToString() + ") " + $element.Name 

                                    write-host $elemento                                            
                                }
                            }
                            #seleccionar archivo seleccionado
                            do{
                                $strfileselect = Read-Host "Ingresa el nombre del archivo que quieres mover"
                                Write-Host "ha elegido la carpeta: "$strfileselect
                                $strfilemove =$newruta + "\"+ $strfileselect
                                if (Test-Path $strfilemove) {
                                 do { 
                                   #muestra directorio completo iric701
                                    Write-Host "Elija el directorio donde movera el archivo"
                                    $listado = Get-ChildItem $raiztwo
                                    [int]$cont = 0
                                    [string]$elemento = ""
                                    foreach ($element in $listado){
                                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                                            $cont++     
                                            $elemento = $cont.ToString() + ") " + $element.Name 

                                            write-host $elemento                                            
                                        }
                                        }
                                        #elegir carpeta de iric701
                                        $strseleccioncarpeta2 = Read-Host "elija la carpeta a donde copiara el archivo"
                                        Write-Host "ha elegido la carpeta: " $strseleccioncarpeta2
                                        $newruta2 = $raiztwo + $strseleccioncarpeta2
                                           Move-Item -path $strfilemove -destination $newruta2
                                           Write-Host "Se ha copiado el archivo: " $strfilemove "a la carpeta" 
                                           write-host "al directorio: " $newruta2
                                           break
                                           }while ($true)
                                           break
                                           }
                                           else{
                                           Write-Host "El archivo no exixte" 
                                           do{
                                            $resp = Read-Host "Deseas mover otro archivo [S/N]: "
                                            if (($resp.ToUpper() -eq "S") -or ($resp.ToUpper() -eq "N")){
                                                break
                                                }
                                            }while ($true)
                                            if ($resp.ToUpper() -eq "N"){
                                                break
                                               }
                                             }      
                                        }while ($true)
                                        break
                                }while ($true)
                                break

                          
                            }else{
                            write-host "el directorio no existe"
                              do {
                           $resp = Read-Host "Desea intentarlo nuevamente [S/N]:"
                           if (($resp.ToUpper() -eq"S") -or($resp.ToUpper() -eq"N")) {
                               break
                              }
                            } while ($true)
                            if ($resp.ToUpper() -eq"N") {
                                break
                            }
                        }
                     }while ($true)
                      
                 }
           
            #Copiar Directorio
            9 {
                    Write-Host "Elija el directorio que desea copiar"
                    $listado = Get-ChildItem $raiz
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado){
                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                        }
                #inicio do
                    do{
                        $directorio = Read-Host "Ingresa el nombre del directorio que quieres copiar" 
                        Write-Host "El directorio elegido es: " $directorio
                        $newruta = $raiz + $directorio
                        
                        if (Test-Path $newruta) {      
                         do { 

                           
                           Copy-Item -path $newruta -destination $raiztwo
                           Write-Host "Se ha copiado el directorio: "$newruta "a la ubicación c:/temp/iric7017"



                           break
                           }while ($true)
                           break
                           }
                           else{
                           Write-Host "El directorio no exixte" 
                           do{
                            $resp = Read-Host "Deseas renombrar otro directorio [S/N]"
                            if (($resp.ToUpper() -eq "S") -or ($resp.ToUpper() -eq "N")){
                                break
                                }
                            }while ($true)
                            if ($resp.ToUpper() -eq "N"){
                                break
                               }
                             }      
                        }while ($true)
    
                }
               
            #Copiar Archivo terminado
            10 {
                #listar carpetas
                Write-Host "*** Ha elegido la opcion de copiar archivo ***"                
                    $listado = Get-ChildItem $raiz
                    [int]$cont = 0
                    [string]$elemento = ""
                    foreach ($element in $listado) {
                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                            $cont++     
                            $elemento = $cont.ToString() + ") " + $element.Name 

                            write-host $elemento                                            
                        }
                    }
                    
                    do{
                        $carpeta = Read-Host "Ingresa el nombre del directorio donde esta el archivo que quieres copiar"                        
                        $strseleccioncarpeta = $raiz +$carpeta
                        if (Test-Path $strseleccioncarpeta) {
                        do{
                           
                        #11  
                        Write-Host "ha elegido la carpeta: " $strseleccioncarpeta
                            $newruta =$strseleccioncarpeta
                         #listar archivos
                            $listado = Get-ChildItem $newruta
                            [int]$cont = 0
                            [string]$elemento = ""
                            foreach ($element in $listado) {
                                if ($element.GetType().Name.Equals('FileInfo')) {
                                    $cont++     
                                    $elemento = $cont.ToString() + ") " + $element.Name 

                                    write-host $elemento                                            
                                }
                            }
                            #seleccionar archivo seleccionado
                            do{
                                $strfileselect = Read-Host "Ingresa el nombre del archivo que quieres copiar"
                                Write-Host "ha elegido la carpeta: "$strfileselect
                                $strfilemove =$newruta + "\"+ $strfileselect
                                if (Test-Path $strfilemove) {
                                 do { 
                                   #muestra directorio completo iric701
                                    Write-Host "Elija el directorio donde copiara el archivo"
                                    $listado = Get-ChildItem $raiztwo
                                    [int]$cont = 0
                                    [string]$elemento = ""
                                    foreach ($element in $listado){
                                        if ($element.GetType().Name.Equals('DirectoryInfo')) {
                                            $cont++     
                                            $elemento = $cont.ToString() + ") " + $element.Name 

                                            write-host $elemento                                            
                                        }
                                        }
                                        #elegir carpeta de iric701
                                        $strseleccioncarpeta2 = Read-Host "elija la carpeta a donde copiara el archivo"
                                        Write-Host "ha elegido la carpeta: " $strseleccioncarpeta2
                                        $newruta2 = $raiztwo + $strseleccioncarpeta2
                                           Copy-Item -path $strfilemove -destination $newruta2
                                           Write-Host "Se ha copiado el archivo: " $strfilemove "a la carpeta" 
                                           write-host "al directorio: " $newruta2
                                           break
                                           }while ($true)
                                           break
                                           }
                                           else{
                                           Write-Host "El archivo no exixte" 
                                           do{
                                            $resp = Read-Host "Deseas renombrar otro archivo [S/N]: "
                                            if (($resp.ToUpper() -eq "S") -or ($resp.ToUpper() -eq "N")){
                                                break
                                                }
                                            }while ($true)
                                            if ($resp.ToUpper() -eq "N"){
                                                break
                                               }
                                             }      
                                        }while ($true)
                                        break
                                }while ($true)
                                break

                          #22
                            }else{
                            write-host "el directorio no existe"
                              do {
                           $resp = Read-Host "Desea intentarlo nuevamente [S/N]:"
                           if (($resp.ToUpper() -eq"S") -or($resp.ToUpper() -eq"N")) {
                               break
                              }
                            } while ($true)
                            if ($resp.ToUpper() -eq"N") {
                                break
                            }
                        }
                     }while ($true)
                      
                 }

            }
                
            }
    } else {
        Write-Host "Ingresa valor"
    }     
} while ($true)