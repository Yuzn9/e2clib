// Définir les variables - récup les éléments html nécessaire 
const connectButton = document.querySelector("#connect-button");
const main = document.querySelector("main");
let count = 0;

// Définir les fonctions - les différentes actions possibles 
function addText() {
    count ++;
    let newText = document.createElement("p");
    newText.classList.add("js-zone")
    if(count%2==0) {
        newText.style.color = "red"    
    }

    if(count <= 10) {
        newText.innerHTML = `Tentative de connexion n°${count}`
    } else {
        newText.innerHTML = "T'as pas compris que ça marchait pas ?"
        connectButton.removeEventListener("click", addText);
    }
    main.appendChild(newText)
}

// mettre en place les déclencheurs - ce qui va déclencher les actions qu'on a définit ( écouteur d'évenement )
connectButton.addEventListener("click", addText);   
