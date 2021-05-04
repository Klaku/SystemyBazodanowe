var fs = require('fs');
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

for(var i=0; i<100000; i++){
    fs.appendFileSync('fillOceny.sql',"insert into Oceny values(2,1,1,cast(rand()*1000 as int),'"+makeid(200)+"');\n");
}