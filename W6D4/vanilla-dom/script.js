document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
  const handlePlaceInput = (e) => {
    e.preventDefault();
    const input = document.querySelector(".favorite-input");
    const place = input.value;
    input.value = "";
    const newList = document.createElement("li");
    newList.textContent = place;
    const list = document.getElementById("sf-places");
    list.appendChild(newList);
  };

  document.querySelector(".favorite-submit").addEventListener("click", handlePlaceInput);

  // adding new photos
  const showForm = (e) => {
    const photoDiv = document.querySelector(".photo-form-container");
    if (photoDiv.className === "photo-form-container") {
      photoDiv.className = "photo-form-container hidden";
    } else {
      photoDiv.className = "photo-form-container";
    }
  };

  document.querySelector(".photo-show-button").addEventListener("click", showForm);

  // --- your code here!
  const handlePhotoInput = (e) => {
    e.preventDefault();
    const input = document.querySelector(".photo-url-input");
    const photoURL = input.value;
    input.value = "";
    const newList = document.create("li");
    const newPhoto = document.create("img");
    newPhoto.src = photoURL;
    newList.appendChild(newPhoto);
    const wholeList = document.querySelector(".dog-photos");
    wholeList.appendChild(newList);
  };

  document.querySelector(".photo-url-submit").addEventListener("click", handlePhotoInput);

});
