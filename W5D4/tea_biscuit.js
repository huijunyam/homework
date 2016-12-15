const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function teaAndBiscuits () {
  reader.question('Would you like tea?', function (ans) {
    console.log(`User replied: ${ans}`);
    reader.question('Would you want some biscuits?', function (ans2){
      console.log(`User replied: ${ans2}`);
      const firstRes = (ans === 'yes') ? 'do' : 'don\'t';
      const secondRes = (ans2 === 'yes') ? 'do' : 'don\'t';
      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });
}

teaAndBiscuits();
