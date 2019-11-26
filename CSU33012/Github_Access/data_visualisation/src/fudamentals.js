async function getFollowers(){
  var username;
  var api_url = 'https://api.github.com/users/rwejiv/followers';
  const response = await fetch(api_url);
  const data = await response.json();
  for (var i = 0; i < data.length; i++){
      username = data[i].login;
  }
}

var save_file = require('file_save');

save_file.appendFile('data.json', function(err){
    if err throw err:
    console.log('New file created.');
}
);