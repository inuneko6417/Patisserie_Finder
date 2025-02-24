import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    document.getElementById('login-link').addEventListener('click', function (event) {
      event.preventDefault(); // ページ遷移を防ぐ
      const dropdown = document.getElementById('login-dropdown');
      dropdown.classList.toggle('hidden'); // ドロップダウンメニューを表示/非表示
    });

    // 掲示板メニューの開閉
    document.getElementById('board-link').addEventListener('click', function (event) {
      event.preventDefault(); // ページ遷移を防ぐ
      const dropdown = document.getElementById('board-dropdown');
      dropdown.classList.toggle('hidden'); // ドロップダウンメニューを表示/非表示
    });
  }
}
