#!/usr/bin/tclsh

puts "***********************"
puts "        CLI Screen     "
puts "***********************"

set prompt "YelTrace> "
set done 0

while {!$done} { 
    puts -nonewline $prompt
    flush stdout
    gets stdin line
    set line [string trim $line]
    switch -- $line {
        "show version" {
            puts "This is version 1.0"
        }
        "exit" {
            set done 1
            break
        }
        "help" {
            puts "enable - Kullanici privilege moda giris yapar."
            puts "exit   - Cikis yapar."
            puts "help   - Yardim menusunu acar."
        }
        "enable" {
            puts "Kullanici adi:"
            flush stdout
            gets stdin username
            puts "Sifre:"
            flush stdout
            gets stdin password
            if {$username eq "admin" && $password eq "123"} {
                set isim "admin"
                puts "Merhaba $isim"
                set prompt "Admin#"
                while {1} {
                    puts "---------"
                    puts "ANA MENU"
                    puts "---------"
                    puts "1. Cihaz listesini goruntule"
                    puts "2. Cihaza IP adresi atama"
                    puts "3. Cihazin mevcut IP adresini goruntule"
                    puts "Secim Yapiniz:"
                    set devices [list "Switch" "Router" ]
                    set choice [gets stdin]
                    switch -- $choice {
                        1 {
                            # Cihaz listesini goruntule
                            puts "Cihazlar:"
                            foreach device $devices {
                                puts "- $device"
                            }
                            puts ""
                        }
                        2 {
                            # Cihaza IP adresi atama
                            puts "Hangi cihaza IP adresi atamak istiyorsunuz? (Ornek: Switch-1)"
                            set device [gets stdin]
                            puts "Lutfen cihaza atayacaginiz IP adresini girin: (Ornek: 192.168.1.2)"
                            set ip_address [gets stdin]
                            puts "Lutfen alt ag maskesini girin: (Ornek: 255.255.255.0)"
                            set subnet_mask [gets stdin]
                            puts "Cihazin IP adresi $ip_address $subnet_mask olarak atandi."
                            puts ""
                        }
                        3 {
                            # Cihazin mevcut IP adresini goruntule
                            puts "Hangi cihazin IP adresini goruntulemek istiyorsunuz? (Ornek: Router-1)"
                            set device [gets stdin]
                            puts "Cihazin mevcut IP adresi: 192.168.1.1"
                            puts ""
                        }
                        default {
                            # Gecersiz islem numarasi
                            puts "Lutfen gecerli bir islem numarasi girin."
                            puts ""
                        }
                    }
                }
                set prompt "YelTrace> "
            } else {
                puts "Kullanici adi veya sifre hatali"
                set prompt "YelTrace> "
            }
        }
        default {
            # Geçersiz komut
            puts "Gecersiz komut: $line"
        }
    }
}
