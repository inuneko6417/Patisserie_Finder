document.addEventListener("DOMContentLoaded", () => {
  const nextStepButton = document.getElementById("next-step");
  const accountSection = document.getElementById("account-section");
  const loginSection = document.getElementById("login-section");

  nextStepButton.addEventListener("click", () => {
    // アカウント名が入力されているかチェック
    const accountName = document.getElementById("account-name").value;
    if (accountName.trim() === "") {
      alert("アカウント名を入力してください");
      return;
    }

    // フォームの表示を切り替える
    accountSection.classList.add("hidden");
    loginSection.classList.remove("hidden");
  });
});
