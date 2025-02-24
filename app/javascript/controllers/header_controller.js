import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.getElementById('navbar-toggler').addEventListener('click', function () {
      const menu = document.getElementById('navbar-menu');
      menu.classList.toggle('hidden');
    });

    // プロフィールメニューの開閉
    document.getElementById('profile-link').addEventListener('click', function (event) {
      event.preventDefault(); // ページ遷移を防ぐ
      const dropdown = document.getElementById('profile-dropdown');
      dropdown.classList.toggle('hidden'); // ドロップダウンメニューを表示/非表示
    });
  }
}
