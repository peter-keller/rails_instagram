function fireEvents() {
  let userPictures = document.querySelectorAll(".darken");
  let userStats = document.querySelectorAll(".contentSpan");
  userPictures.forEach(function(item, index) {
    item.addEventListener("mouseenter", function() {
      userStats[index].children[0].style.opacity = "1";
      userStats[index].children[1].style.opacity = "1";
      console.log(userStats[index].children[0].style.opacity);
    });

    item.addEventListener("mouseleave", function() {
      userStats[index].children[0].style.opacity = "0";
      userStats[index].children[1].style.opacity = "0";
    });
  });
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", fireEvents);
} else {
  firePage();
}
