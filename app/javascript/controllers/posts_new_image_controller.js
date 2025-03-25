import { Controller } from "@hotwired/stimulus";
import Swiper from "swiper/bundle";
import "swiper/css/bundle";

export default class extends Controller {
  connect() {
    document.addEventListener("turbo:load", () => {
      const imageFieldsContainer = document.getElementById("image-fields-container");
      const previewContainer = document.getElementById("image-preview-container");

      const handleImagePreview = (event) => {
        const fileInput = event.target;
        const files = Array.from(fileInput.files); // ファイルを配列化

        files.forEach((file, index) => {
          const reader = new FileReader();

          reader.onload = (e) => {
            const imgContainer = document.createElement("div");
            imgContainer.className = "relative w-24 h-24 mt-2";
            imgContainer.dataset.index = index; // ファイルごとにインデックスを設定

            const img = document.createElement("img");
            img.src = e.target.result;
            img.className = "w-full h-full object-cover rounded-md";

            const deleteButton = document.createElement("button");
            deleteButton.innerHTML = "×";
            deleteButton.className = "absolute top-0 right-0 bg-red-500 text-white rounded-full w-6 h-6 flex items-center justify-center";

            deleteButton.addEventListener("click", () => {
              imgContainer.remove();

              // `DataTransfer` を使って現在のファイルリストから削除
              const dataTransfer = new DataTransfer();
              Array.from(fileInput.files).forEach((f, i) => {
                if (i !== index) { // 削除対象以外のファイルを DataTransfer に追加
                  dataTransfer.items.add(f);
                }
              });

              fileInput.files = dataTransfer.files; // 新しいファイルリストを設定
            });

            imgContainer.appendChild(img);
            imgContainer.appendChild(deleteButton);
            previewContainer.appendChild(imgContainer);
          };

          reader.readAsDataURL(file);
        });
      };

      const initialFileField = document.querySelector('input[type="file"]');
      if (initialFileField) {
        initialFileField.addEventListener("change", handleImagePreview);
      }
    });
  }
}
