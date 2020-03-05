const receitas = document.querySelectorAll(".seeRecipes")

const infos = document.querySelectorAll('.remove')
const icons = document.querySelectorAll('.icons')

for (let i = 0; i < icons.length; i++) {
    icons[i].addEventListener("click", () => {
       if (infos[i].classList.contains("hide")) {
           icons[i].innerHTML = "esconder";
           infos[i].classList.remove("hide")
       } else {
            icons[i].innerHTML = "mostrar"; 
            infos[i].classList.add("hide")
        }
    })
}

function addIngredient() {
    const ingredients = document.querySelector("#ingredients");
    const fieldContainer = document.querySelectorAll(".ingredient");
  
    // Realiza um clone do último ingrediente adicionado
    const newField = fieldContainer[fieldContainer.length - 1].cloneNode(true);
  
    // Não adiciona um novo input se o último tem um valor vazio
    if (newField.children[0].value == "") return false;
  
    // Deixa o valor do input vazio
    newField.children[0].value = "";
    ingredients.appendChild(newField);
}
  
document.querySelector(".add-ingredient")
document.addEventListener("click", addIngredient);

function addPreparation() {
    const preparation = document.querySelector("#preparation");
    const fieldContainer2 = document.querySelectorAll(".step");

    // Realiza um clone do último ingrediente adicionado
    const newField2 = fieldContainer2[fieldContainer2.length - 1].cloneNode(true);

    // Não adiciona um novo input se o último tem um valor vazio
    if (newField2.children[0].value == "") return false;

    // Deixa o valor do input vazio
    newField2.children[0].value = "";
    preparation.appendChild(newField2);
}
  
document.querySelector(".add-preparation")
document.addEventListener("click", addPreparation);


const deleteButtons = document.querySelectorAll("#delete");
for (let deleteButton of deleteButtons) {
    deleteButton.addEventListener("submit", (event) => {
        const confirmation = confirm("Você tem certeza que quer deletar a receita?")
        if (!confirmation) {
        event.preventDefault()
        }
    })
}

/* Pagination */

function paginate(selectedPage, totalPages) {
    let pages = [],
        oldPage

    for (let currentPage = 1; currentPage <= totalPages; currentPage++) {
        const firstAndLastPage = currentPage == 1 || currentPage == totalPages;
        const pagesBeforeSelectedPage = selectedPage >= currentPage - 2;
        const pagesAfterSelectedPage = selectedPage <= currentPage + 2;

        if(firstAndLastPage || pagesBeforeSelectedPage && pagesAfterSelectedPage) {
            if(oldPage && currentPage - oldPage > 2) {
                pages.push("...")
            };
            if(oldPage && currentPage - oldPage == 2) {
                pages.push(oldPage + 1)
            }
            pages.push(currentPage)
            oldPage = currentPage
        }
    }
    return pages
}

function createPagination(pagination) {
    const filter = pagination.dataset.filter;
    const page = +pagination.dataset.page;
    const total = +pagination.dataset.total;
    const pages = paginate(page, total);

    let elements = "";

    for(let page of pages) {
        if(String(page).includes("...")) {
            elements += `<span>${page}</span>`
        } else {
            if(filter) {
                elements += `<a href="?page=${page}&filter=${filter}">${page}</a>`
            } else {
                elements += `<a href="?page=${page}">${page}</a>`
            }
        }
    }
    pagination.innerHTML = elements;
}

const pagination = document.querySelector(".pagination");
if(pagination) {
    createPagination(pagination)
}

/* === PHOTOS UPLOAD ===*/

const PhotosUpload = {
    uploadLimit: 5,
    files: [],
    input: "",
    preview: document.querySelector("#photos-preview"),

    handleFileInput(event) {
        const {files: fileList} = event.target;
        PhotosUpload.input = event.target;
       
        if(PhotosUpload.hasLimit(event)) return
        
        Array.from(fileList).forEach(file => {
            PhotosUpload.files.push(file);
            
            const reader = new FileReader();
            
            reader.onload = () => {
                const image = new Image();
                image.src = String(reader.result)
                const div = PhotosUpload.getContainer(image)
                PhotosUpload.preview.appendChild(div) //coloca a div criada dentro do "photos-preview"
            }

            reader.readAsDataURL(file)
        })

        PhotosUpload.input.files = PhotosUpload.getAllFiles()
    },

    getAllFiles() {
        const dataTransfer = new ClipboardEvent("").clipboardData || new DataTransfer()
        PhotosUpload.files.forEach(file => dataTransfer.items.add(file))
        return dataTransfer.files
    },

    hasLimit(event) {
        const {uploadLimit, input, preview} = PhotosUpload;
        const {files: fileList} = input;

        if(fileList.length > uploadLimit) {
            alert(`Enviar no máximo ${uploadLimit} fotos!`)
            event.preventDefault()
            return true
        }

        const photosDiv = [];
        preview.childNodes.forEach(item => {
            if(item.classList && item.classList == "photo") {
                photosDiv.push(item)
            }
        })

        const totalPhotos = fileList.length + photosDiv.length;
        if (totalPhotos > uploadLimit) {
            alert("Você atingiu o limite máximo de fotos!")
            event.preventDefault()
            return true
        }
            return false 
    },

    getContainer (image) {
        const div = document.createElement('div'); //cria uma div
        div.classList.add('photo'); //coloca uma classe 'photo' na div criada
        div.onclick = PhotosUpload.removePhoto;
        div.appendChild(image); //coloca a image na div criada
        div.appendChild(PhotosUpload.getRemoveButton());
        return div;
    },

    getRemoveButton () {
        const button = document.createElement('i');
        button.classList.add('material-icons');
        button.innerHTML = 'close';
        return button;
    },

    removePhoto(event) {
        const photoDiv = event.target.parentNode;
        const photosArray = Array.from(PhotosUpload.preview.children);
        const index = photosArray.indexOf(photoDiv);

        PhotosUpload.files.splice(index, 1)
        PhotosUpload.input.files = PhotosUpload.getAllFiles()
        photoDiv.remove()
    },

    removeOldPhoto(event) {
        const photoDiv = event.target.parentNode;

        if (photoDiv.id) {
            const removedFile = document.querySelector('input[name="removed_files"]')
            if (removedFile) {
                removedFile.value += `${photoDiv.id},`
            }
        }
        photoDiv.remove()
    }
}

const ImageGallery = {
    highlight: document.querySelector('.gallery .highlight > img'),

    previews: document.querySelectorAll('.gallery_preview img'),

    setImage(e) {
        const {target} = e;

        ImageGallery.previews.forEach(preview => preview.classList.remove('active'))

        target.classList.add('active')

        ImageGallery.highlight.src = target.src;
    }
}

const LightBox = {
    target: document.querySelector('.lightbox-target'),

    image: document.querySelector('.lightbox-target img'),

    closeButton: document.querySelector('.lightbox-target a.lightbox-close'),

    open() {
        LightBox.target.style.opacity = 1;
        LightBox.target.style.top = 0;
        LightBox.target.style.bottom = 0;
        LightBox.closeButton.style.top = 0;
    },

    close() {
        LightBox.target.style.opacity = 0;
        LightBox.target.style.top = "-100%";
        LightBox.target.style.bottom = "initial";
        LightBox.closeButton.style.top = "-80px";
    }
}