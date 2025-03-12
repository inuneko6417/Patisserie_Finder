import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["select", "preview"]

  selectImages() {
    const files = this.selectTarget.files
    for (const file of files) {
      this.uploadImage(file)
    }
    this.selectTarget.value = ""
  }

  uploadImage(file) {
    const csrfToken = document.querySelector('meta[name="csrf-token"]').content
    const formData = new FormData()
    formData.append("image", file)

    fetch("/posts/upload_image", {
      method: "POST",
      headers: { "X-CSRF-Token": csrfToken },
      body: formData
    })
      .then(response => response.json())
      .then(data => {
        this.previewImage(file, data.id)
      })
      .catch(error => console.error(error))
  }

  previewImage(file, id) {
    console.log("画像プレビュー開始")  // デバッグ

    const preview = this.previewTarget
    const fileReader = new FileReader()

    fileReader.onload = () => {
      console.log("画像読み込み成功")  // デバッグ
      const img = new Image()
      img.src = fileReader.result
      img.width = 100

      const imgBox = document.createElement("div")
      imgBox.classList.add("image-box", "inline-flex", "mx-1", "mb-5")
      imgBox.dataset.imagesTarget = "imageBox"

      const imgInnerBox = document.createElement("div")
      imgInnerBox.classList.add("text-center")

      const deleteBtn = document.createElement("a")
      deleteBtn.classList.add("link", "cursor-pointer")
      deleteBtn.dataset.action = "click->images#deleteImage"
      deleteBtn.textContent = "削除"

      const hiddenField = document.createElement("input")
      hiddenField.type = "hidden"
      hiddenField.name = "post[images][]"
      hiddenField.value = id

      imgInnerBox.appendChild(img)
      imgInnerBox.appendChild(deleteBtn)
      imgInnerBox.appendChild(hiddenField)
      imgBox.appendChild(imgInnerBox)

      preview.appendChild(imgBox)
    }

    fileReader.readAsDataURL(file)
  }

  deleteImage(event) {
    event.preventDefault()
    const imageBox = event.currentTarget.closest(".image-box")
    console.log("削除ボタン動作確認", imageBox) // デバッグ
    if (imageBox) {
      imageBox.remove()
    }
  }
}
