var inputs = document.querySelectorAll('input');

// events
for (var input of inputs ){
    input.onkeyup = function(e) {
        inputName = this.name;
        inputTab = this.getAttribute('data-tab');
        inputVal = this.value; // updates the variable on each ocurrence
        //let nomChamp = 'nom'+input_name[0].toUpperCase()+input_name.substr(1);
        console.log(inputTab, inputName, inputVal);
        if (inputVal.length > 0) {
            fetch('http://localhost/recette/admin/admin.php?action=recette&nomTable='+inputTab+'&nomChamps='+inputName+'&search='+inputVal)
            .then(function (response) {
                return response.json();
            }).then(function (liste) {
                console.log(liste);
                autocomplete_results = document.getElementById("hugeList_"+inputTab);
                autocomplete_results.innerHTML = '';
                for (i = 0; i < liste.length; i++) {
                    autocomplete_results.innerHTML += '<option>' + liste[i] + '</option>';
                }
                autocomplete_results.style.display = 'block';
            });            
            
        }
    }
}