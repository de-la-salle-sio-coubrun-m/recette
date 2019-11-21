var inputs = document.querySelectorAll('input');

// events
for (var input of inputs ){
    input.onkeyup = function(e) {
        input_name = this.name;
        input_val = this.value; // updates the variable on each ocurrence
        let nomChamp = 'nom'+input_name[0].toUpperCase()+input_name.substr(1);
        if (input_val.length > 0) {
        fetch('http://localhost/recette/admin/admin.php?action=recette&nomTable='+input_name+'&nomChamps='+nomChamp+'&search='+input_val)
            .then(function (response) {
                return response.json();
            }).then(function (liste) {
                autocomplete_results = document.getElementById("hugeList_"+input_name);
                autocomplete_results.innerHTML = '';
                for (i = 0; i < liste.length; i++) {
                    autocomplete_results.innerHTML += '<option>' + liste[i] + '</option>';
                }
                autocomplete_results.style.display = 'block';
            });            
            
        }
    }
}