function fireEvents() {
  let userPictures = document.querySelectorAll(".darken");
  let userStats = document.querySelectorAll(".contentSpan");
  let likes = document.querySelectorAll(".likeCounter");
  userPictures.forEach(function(item, index) {
    item.addEventListener("mouseenter", function() {
      userStats[index].children[0].style.opacity = "1";
      userStats[index].children[1].style.opacity = "1";
    });

    item.addEventListener("mouseleave", function() {
      userStats[index].children[0].style.opacity = "0";
      userStats[index].children[1].style.opacity = "0";
    });

    item.addEventListener("click", function() {
      const modal = document.querySelector(`#myModal${index}`);
      modal.classList.toggle("show");
      modal.style.display = "block";
    });

    const close = document.querySelector(`#close${index}`);
    close.addEventListener("click", function() {
      const modal = document.querySelector(`#myModal${index}`);
      modal.classList.toggle("show");
      modal.style.display = "none";
    });

    const like = document.querySelector(`#newLike${index}`);
    like.addEventListener("click", function(item) {
      const post_id = like.getAttribute("post_id");
      let splitted = likes[index].textContent.split(" ");
      likes[index].textContent = [
        parseInt(splitted[0], 10) + 1,
        splitted[1]
      ].join(" ");
      sendRequest(post_id);
    });
  });
}

function sendRequest(id) {
  data = { post_id: id };
  url = "http://localhost:3000/likes";
  fetch(url, {
    method: "POST", // or 'PUT'
    body: JSON.stringify(data), // data can be `string` or {object}!
    headers: {
      "Content-Type": "application/json"
    }
  })
    .then(res => res.json())
    .then(response => console.log("Success:", JSON.stringify(response)))
    .catch(error => console.error("Error:", error));
}

if (document.readyState === "loading") {
  document.addEventListener("DOMContentLoaded", fireEvents);
} else {
  firePage();
}
