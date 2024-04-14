window.addEventListener("load", () => {
    document.getElementById("saveBtn").addEventListener("click", handleSaveBtnClick);
    document.getElementById("searchTagIpt").addEventListener("keyup", handleSearchTagInput);
    document.getElementById("thumbnail_input").addEventListener("input", handleThumbnailInput);
    document.querySelectorAll(".eraseBtn").forEach(btn => btn.addEventListener("click", deleteSearchTag));

    document.getElementById("longTitle").addEventListener("input", e =>
        handleTextCount(e, 32, "longTitleCounter")
    );
    document.getElementById("shortTitle").addEventListener("input", e =>
        handleTextCount(e, 7, "shortTitleCounter")
    );
    document.getElementById("pjIntro").addEventListener("input", e =>
        handleTextCount(e, 50, "introCounter")
    );
});
const handleSearchTagInput = (e) => {
    console.log(e);
    const inputTxt = e.target.value;
    if (validInput(inputTxt)) {
        alert("공백 및 특수문자는 입력할 수 없습니다.");
        clearInput(e);
        return;
    }
    if (enterPressed(e)) {
        if (countTag() >= 5) {
            alert("태그는 최대 5개 까지 입력할 수 있습니다");
            clearInput(e);
            return;
        }
        makeSearchTag(inputTxt);

        clearInput(e);
    }
};
const makeSearchTag = (inputTxt) => {
    const span = document.createElement("span");
    const button = document.createElement("button");
    const i = document.createElement("i");
    span.className = "searchTag";
    span.innerText = inputTxt;
    button.className = "eraseBtn";
    i.className = "fa-solid fa-x fa-2xs";

    button.appendChild(i);
    span.appendChild(button);

    button.addEventListener("click", deleteSearchTag);
    document.querySelector("#tagContainer").appendChild(span);
};
const countTag = () => {
    const tagCount = document.querySelector("#tagContainer").children.length;
    return tagCount;
};
const enterPressed = (e) => {
    return e.key === "Enter";
};
const validInput = (text) => {
    let regExp = /[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/ ]/gim;
    return text === "" || regExp.test(text);
};

const deleteSearchTag = (e) => {
    e.currentTarget.parentElement.outerHTML = "";
};
const handleSaveBtnClick = () => {
    const formData = getPjInfoForm();
    const endPoint = "/project/editor/infoUpdate";

    postProject(endPoint, formData);
};
const concatSearchTags = () => {
    const tagList = document.querySelector("#tagContainer").children;
    const tagArr = [...tagList].map(span => span.innerText);
    // 태그를 컴마로 구문된 문자열로 합친다.

    return tagArr.toString();
};
const getPjInfoForm = () => {
    const formData = new FormData();
    const longTitle = document.querySelector("#longTitle").value;
    const shotTitle = document.querySelector("#shortTitle").value;
    const pjIntro = document.querySelector("#pjIntro").value;
    const category = document.querySelector(".category").value;
    const searchTags = concatSearchTags();

    formData.append("pj_long_title", longTitle);
    formData.append("pj_short_title", shotTitle);
    formData.append("pj_short_intro", pjIntro);
    formData.append("ctg", category);
    formData.append("pj_tag", searchTags);

    return formData;
};
const handleThumbnailInput = async (e) => {
    const endPoint = "/project/editor/info/image";
    const imgFormData = getImageFormData("thumbnail_input");
    const src_url = await fetchImage(endPoint, imgFormData);

    printImgTag("thumbnail_img", src_url);
    clearInput(e);
}