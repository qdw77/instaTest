// let joinBtn = document.getElementById('join-btn');
// let animtateInput = document.querySelectorAll('.animate-input');


// let emailAct = nameAct = idAct = pwAct = false;
// // console.log(emailAct, emailAct, idAct, pwAct)

// let userEmail = document.getElementById('user-email');
// let userName = document.getElementById('user-name')
// let userId = document.getElementById('user-id')
// let userPw = document.getElementById('user-pw')

// // console.log(userEmail, userName, userId, userPw)

// function updateInputState(val, activeVar) {
//   if(val.value.trim().length > 0) {
//     // animate-input 에 active class add
//     val.parentElement.classList.add('active');
//     activeVar = true
//   }else{
//     val.parentElement.classList.remove('active');
//     activeVar = false;
//   }

//   return activeVar;
// }

// animtateInput.forEach((item) => {
//   let input = item.querySelector('input');

//   input.addEventListener('keyup', () => {
//     if(input == userEmail){
//       emailAct = updateInputState(input, emailAct);
//     } 
//   })

// })


let joinBtn = document.getElementById('join-btn');
let animateInput = document.querySelectorAll('.animate-input');

let emailAct = nameAct = idAct = pwAct = false;

let userEmail = document.getElementById('user-email');
let userName = document.getElementById('user-name');
let userId = document.getElementById('user-id');
let userPw = document.getElementById('user-pw');


let pwBtn = document.getElementById('pw-btn');


function updateInputState(val, activeVar) {
  if(val.value.trim().length > 0) {
    // animate-input 에 active class add
    val.parentElement.classList.add('active');
    activeVar = true
  } else {
    // animate-input 에 active class remove
    val.parentElement.classList.remove('active');
    activeVar = false;
  }

  return activeVar;
}



animateInput.forEach((item) => {
  let input = item.querySelector('input');
  
  input.addEventListener('keyup', () => {
    if(input == userEmail) {
      emailAct = updateInputState(input, emailAct);
    } else if (input == userName) {
      nameAct = updateInputState(input, nameAct);
    }else if(input == userId){
      idAct = updateInputState(input, idAct)
    }else if(input == userPw){
      pwAct = updateInputState(input, pwAct);
    }
    let allTrue = emailAct && nameAct && idAct && pwAct;
    if(allTrue) {
      // allTrue 값이 모두 참일 때
      // joinBtn disanled 속성 remove
      joinBtn.removeAttribute('disabled')
    } else {
      joinBtn.setAttribute('disabled', true);
    }
  })
})

function modeToggle(){
// 상향연산자
// 조건 ? true : false
  let pwType = userPw.getAttribute('type') =='password';
// userPw type : password => text | pwBtn.innerHtml = '숨기기'
  userPw.setAttribute('type', pwType ? 'text' : 'password');
// userPw type : text => password | pwBtn.innerHtml = '비밀번호 표시'
  pwBtn.innerHTML = pwType ? '숨기기' : '비밀번호표시';
}

pwBtn.addEventListener('click', modeToggle);


// https://wepplication.github.io/tools/compareDoc/ 
// 문서비교 사이트
