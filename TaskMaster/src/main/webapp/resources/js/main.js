// Include jQuery
const script1 = document.createElement('script');
script1.src = "https://code.jquery.com/jquery-3.6.4.min.js";
document.head.appendChild(script1);

// Include Ionicons (module)
const script2 = document.createElement('script');
script2.type = "module";
script2.src = "https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js";
document.head.appendChild(script2);

// Include Ionicons
const script3 = document.createElement('script');
script3.src = "https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js";
document.head.appendChild(script3);

// Include Bootstrap JS
const script4 = document.createElement('script');
script4.src = "https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js";
document.head.appendChild(script4);

// Include Font Awesome
const link1 = document.createElement('link');
link1.rel = "stylesheet";
link1.href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css";
document.head.appendChild(link1);

// Include local Bootstrap CSS
const link2 = document.createElement('link');
link2.rel = "stylesheet";
link2.href = "../../assets/vendor/bootstrap/css/bootstrap.min.css";
document.head.appendChild(link2);

// Include main CSS
const link3 = document.createElement('link');
link3.rel = "stylesheet";
link3.href = "/resources/css/main.css";
document.head.appendChild(link3);
