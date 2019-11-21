var input = document.getElementById('idCategorie');
var results;

if (window.dataList) {
    // dataList existe
    console.log(dataList);
}
// functions
function autocomplete(val) {
  var dataList_return = [];

  for (i = 0; i < dataList.length; i++) {
      console.log(dataList[i].toLowerCase().match(val));
    if (dataList[i].toLowerCase().match(val)) {
      dataList_return.push(dataList[i]);
    }
  }

  return dataList_return;
}

// events
input.onkeyup = function(e) {
  input_val = this.value; // updates the variable on each ocurrence

  if (input_val.length > 0) {
    var dataList_to_show = [];

    autocomplete_results = document.getElementById("hugeList");
    autocomplete_results.innerHTML = '';
    dataList_to_show = autocomplete(input_val);
    
    for (i = 0; i < dataList_to_show.length; i++) {
      autocomplete_results.innerHTML += '<option>' + dataList_to_show[i] + '</option>';

    }
    autocomplete_results.style.display = 'block';
  } else {
    dataList_to_show = [];
    autocomplete_results.innerHTML = '';
  }
}