let main=null;
let large=null;
let middle=null;
let sub=null;

const categorySelect1 = (target) => {
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    main=target.value;
    document.getElementById("largeIns").innerHTML =
    this.responseText;
  }
  xhttp.open("GET", "http://localhost:8080/item/category/getLarge?main="+target.value, false);
  xhttp.send();
}
const categorySelect2 = (target) => {
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    large=target.value;
    document.getElementById("middleIns").innerHTML =
    this.responseText;
  }
  xhttp.open("GET", "http://localhost:8080/item/category/getMiddle?large="+target.value, false);
  xhttp.send();
}
const categorySelect3 = (target) => {
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    middle=target.value;
    document.getElementById("subIns").innerHTML =
    this.responseText;
  }
  xhttp.open("GET", "http://localhost:8080/item/category/getSub?middle="+target.value, false);
  xhttp.send();
}
const categorySelect4 = (target) => {
  sub=target.value;
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("specIns").innerHTML =
    this.responseText;
  }
  xhttp.open("GET", "http://localhost:8080/item/category/getSpec?main="+main
    +"&&large="+large+"&&middle="+middle+"&&sub="+sub, false);
  xhttp.send();
}
const categorySelect5 = (target) => {
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    main=target.value;
    document.getElementById("largeUp").innerHTML =
    this.responseText;
  }
  xhttp.open("GET", "http://localhost:8080/item/category/getLarge?main="+target.value, false);
  xhttp.send();
}
const categorySelect6 = (target) => {
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    large=target.value;
    document.getElementById("middleUp").innerHTML =
    this.responseText;
  }
  xhttp.open("GET", "http://localhost:8080/item/category/getMiddle?large="+target.value, false);
  xhttp.send();
}
const categorySelect7 = (target) => {
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    middle=target.value;
    document.getElementById("subUp").innerHTML =
    this.responseText;
  }
  xhttp.open("GET", "http://localhost:8080/item/category/getSub?middle="+target.value, false);
  xhttp.send();
}
const categorySelect8 = (target) => {
  sub=target.value;
  const xhttp = new XMLHttpRequest();
  xhttp.onload = function() {
    document.getElementById("specUp").innerHTML =
    this.responseText;
  }
  xhttp.open("GET", "http://localhost:8080/item/category/getSpec?main="+main
    +"&&large="+large+"&&middle="+middle+"&&sub="+sub, false);
  xhttp.send();
}