var names = ["Rafał", "Tomasz", "Krzysztof", "Anna", "Maria", "Janina", "Kacper", "Agnieszka"];
var snames = ["Kowalski","Nowak","Kasprzyk","Woźniak","Zaręba","Kamysz","Duda","Kaczyński","Tomczak"];
var Miasto = ["Warszawa", "Łódź", "Kraków","Katowice","Gdańsk","Gdynia","Sopot","Szczecin","Olsztyn","Białystok"];
var Ulica = ["Piotrkowska","Nowobielańska","Al Jerozolimskie", "Gdańska","Narutowicza","Nowy Świat","Topologi","Biała","Czarna","Zielona"];
var fs = require('fs');
var i = 0;
var users = ()=>{
    names.forEach(name =>{
        snames.forEach(sname =>{
            Miasto.forEach(city =>{
                Ulica.forEach(ulica =>{
                    if(Math.floor(Math.random()*4) % 3 == 0){
                        i++;
                        fs.appendFileSync('tmp.sql',`exec createUserSeq '${name}', '${sname}', '${city}', '${Math.floor(Math.random()*10000)}', '${ulica}  ${Math.floor(Math.random()*100)+1}'\n`);
                    }
                })
            })
        })
    })
}
users();


var oceny = ()=>{
    for(var index = 0; index< 50000; index++){
        fs.appendFileSync('tmp2.sql',`insert into Oceny values(${Math.floor(Math.random()*3)+2},${Math.floor(Math.random()*6)+1},${Math.floor(Math.random()*(i-5))+1},${Math.floor(Math.random()*10000000)},'${makeid(395)}')\n`);
    }
}
oceny();
function makeid(length) {
    var result           = [];
    var characters       = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    var charactersLength = characters.length;
    for ( var i = 0; i < length; i++ ) {
      result.push(characters.charAt(Math.floor(Math.random() * 
 charactersLength)));
   }
   return result.join('');
}