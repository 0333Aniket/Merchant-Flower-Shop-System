<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
* {
  box-sizing: border-box;
  outline: none;
}

:root {
  --bg-color: #f5f8ff;;
  --main-color: #353536;
  --secondary-color: #8e92a4;
  --main-text-color: #5d606b;
  --secondary-dark-color: #9496a5;
  --tag-color-one: #e0fbf6;
  --tag-color-text-one: #58c2a9;
  --tag-color-two: #ece7fe;
  --tag-color-text-two: #8972f3;
  --tag-color-three: #fde7ea;
  --tag-color-text-three: #e77f89;
  --tag-color-four: #f7f8fc;
  --tag-color-text-four: #a0a6b5;
  --checkbox-color: #009e90;
  --button-color: #49beb7;
  --box-color: #fff1d6;
  --box-color-2: #d3e6ff;
  --box-color-3: #ffd9d9;
  --box-color-4: #daffe5;
  --task-color: #777982;
}

%flex {
  display: flex;
  align-items: center;
}

body {
  margin: 0;
  @extend %flex;
  justify-content: center;
  flex-direction: column;
  overflow: auto;
  width: 100%;
  height: 100vh;
  padding: 20px;
  font-family: 'DM Sans', sans-serif;;
  font-size: 12px;
 /* background-image: linear-gradient(21deg, rgba(64, 83, 206, 0.3697003234675773) 68%, rgba(255, 206, 196, 0.5) 163%),linear-gradient(163deg, rgba(49, 146, 170, 0.07944489965716128) 86%, rgba(239, 112, 138, 0.5) 40%),linear-gradient(30deg, rgba(76, 79, 173, 0.6173675716587805) 22%, rgba(237, 106, 134, 0.5) 169%),linear-gradient(48deg, rgba(31, 85, 147, 0.7323890641868473) 64%, rgba(247, 126, 132, 0.5) 43%); background-blend-mode: overlay,multiply,color,normal; */
}

ul {
  list-style-type: none;
  padding: 0;
}

button { 
  border: none; 
  background: none;
  cursor: pointer;
}

.task-manager {
  display: flex;
  justify-content: space-between;
  width: 100%;
  max-width: 1200px;
  height: 90vh;
  max-height: 900px;
  background: #fff;
  border-radius: 4px;
  box-shadow:
  0 0.3px 2.2px rgba(0, 0, 0, 0.011),
  0 0.7px 5.3px rgba(0, 0, 0, 0.016),
  0 1.3px 10px rgba(0, 0, 0, 0.02),
  0 2.2px 17.9px rgba(0, 0, 0, 0.024),
  0 4.2px 33.4px rgba(0, 0, 0, 0.029),
  0 10px 80px rgba(0, 0, 0, 0.04);
  overflow: hidden;
}

.left-bar {
  background-color: var(--bg-color);
  width: 230px;
  border-right: 1px solid #e3e7f7;
  position: relative;
}

.left-content { padding: 40px; }

.item {
  @extend %flex;
  color: var(--main-color);
  margin-bottom: 14px;
  font-weight: 500;
  
  svg {
    width: 14px;
    height: 14px;
    color: currentcolor;
    margin-right: 10px;
  }
}

.category-list{
  margin-top: 50px;
  
  .item{ color: var(--secondary-color); }
} 

.actions {
  padding: 12px;
  display: flex;
  justify-content: space-between;
}

.circle {
  border-radius: 50%;
  width: 10px;
  height: 10px;
  background-color: #fe4d46;
  box-shadow: 14px 0 0 0 #fbc023, 28px 0 0 0 #7dd21f;
}

.circle-2 {
  border-radius: 50%;
  width: 4px;
  height: 4px;
  background-color: #d5d7e3;
  box-shadow: -6px 0 0 0 #d5d7e3, 6px 0 0 0 #d5d7e3;
}

.right-bar {
  width: 320px;
  border-left: 1px solid #e3e7f7;
  display: flex;
  flex-direction: column;
  
  .header { 
    font-size: 20px; 
    color: var(--main-text-color);
    margin-left: 30px;
  }
}

.top-part {
  padding: 30px;
  @extend %flex; 
  align-self: flex-end;
  
  svg {
    width: 14px;
    height: 14px;
    color: var(--main-color);
    margin-right: 14px;
  }
  
  .count {
    font-size: 12px;
    border-radius: 50%;
    width: 24px;
    height: 24px;
    background-color: #623ce8;
    color: #fff;
    @extend %flex;
    justify-content: center;
  }
}

.right-content {
  padding: 10px 40px;
  overflow-y: auto;
  flex: 1;
}

.task-box {
  position: relative;
  border-radius: 12px;
  width: 100%;
  margin: 20px 0;
  padding: 16px;
  cursor: pointer;
  box-shadow: 2px 2px 4px 0px rgba(235,235,235,1);
  
  &:hover {
    transform: scale(1.02);
  }
}

.time { margin-bottom: 6px; opacity: 0.4; font-size: 10px; }

.task-name { 
  font-size: 14px; 
  font-weight: 500;
  opacity: 0.6;
}

.yellow { 
  background-color: var(--box-color);
}

.blue { background-color: var(--box-color-2); }

.red { background-color: var(--box-color-3); }

.green { background-color: var(--box-color-4); }

.more-button {
  position: absolute;
  width: 3px;
  height: 3px;
  border-radius: 50%;
  background-color: #8e92a4;
  box-shadow: 0 -4px 0 0 #8e92a4, 0 4px 0 0 #8e92a4;
  opacity: 0.4;
  right: 20px;
  top: 30px;
  cursor: pointer;
}

.members {
  display: flex;
  margin-top: 14px;
  
  img {
    border-radius: 50%;
    width: 30px;
    height: 30px;
    margin-right: 4px;
    object-fit: cover;
  }
}

.page-content {
  display: flex;
  flex-direction: column;
  flex: 1;
  padding: 40px 20px 0 20px;
  
  .header { 
    font-size: 26px; 
    color: var(--main-color); 
    margin-top: 30px;
  }
}

.content-categories {
  display: flex;
  justify-content: space-evenly;
  width: 100%;
  border-bottom: 1px solid #ddd;
  padding: 20px 0;
}

.nav-item { display: none; }

.category { 
  font-weight: 500; 
  color: var(--secondary-color); 
  border-bottom: 1px solid #ddd;
  transition: .4s ease-in;
  padding: 20px 30px;
  cursor: pointer;
}

#opt-1:checked + label ,
#opt-2:checked +  label ,
#opt-3:checked +  label ,
#opt-4:checked +  label {
  color: var(--checkbox-color);
  border-bottom: 2px solid var(--checkbox-color);
}

.task-item { display: none; }

.tasks-wrapper {
  padding: 30px 0;
  flex: 1;
  overflow-y: auto;
  height: 100%;
  padding-right: 8px;
}

.task {
  display: flex;
  justify-content: space-between;
  position: relative;
  margin-bottom: 16px;
  padding-left: 30px;
  color: var(--task-color);
  font-size: 13px;
  font-weight: 500;
  
  &:hover {
    transform: translatex(2px);
  }
  
  label {
    cursor: pointer;
  }
}

 label .label-text { position: relative; }

 label .label-text:before {
  content:'';
  position: absolute;
  width: 14px;
  height: 14px;
  border: 1px solid #ddd;
  border-radius: 2px;
  left: -24px;
  transition: .2s ease;
}

.task-item:checked + label .label-text:before {
  background-color: var(--checkbox-color);
  border: none;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24' fill='none' stroke='%23fff' stroke-width='2' stroke-linecap='round' stroke-linejoin='round' class='feather feather-check'%3E%3Cpolyline points='20 6 9 17 4 12'/%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-size: 10px;
  background-position: center;
  border: 1px solid var(--checkbox-color);
}

.tag {
  font-size: 10px;
  padding: 4px 8px;
  border-radius: 20px;
  
  &.approved {
    background-color: var(--tag-color-one);
    color: var(--tag-color-text-one);
  }
  
  &.progress {
    background-color: var(--tag-color-two);
    color: var(--tag-color-text-two);
  }
  
  &.review {
    background-color: var(--tag-color-three);
    color: var(--tag-color-text-three);
  }
  
  &.waiting {
    background-color: var(--tag-color-four);
    color: var(--tag-color-text-four);
  }
}

.upcoming { 
  border-bottom: 1px solid #ddd; 
  padding-bottom: 30px;
  margin-bottom: 30px;
}

@media screen and (max-width: 900px) {
  .left-bar {
    display: none;
  }
}

@media screen and (max-width: 700px) {
  .task-manager {
    flex-direction: column;
    overflow-y: auto;
  }
  
  .right-bar, .page-content {
    width: 100%;
    display: block;
  }
  
  .tasks-wrapper { height: auto; }
}

@media screen and (max-width: 520px) {
  .page-content { padding: 40px 10px 0 10px; }
  
  .right-content { padding: 10px 16px; }
  
  .category { padding: 20px; }
}
 
    form {
        max-width: 400px;
        margin: 0 auto;
    }
    input[type="text"],
    select,
    input[type="file"] {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        box-sizing: border-box;
        border-radius: 8px;
    }
    input[type="submit"] {
        background-color: #ed6c79;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
        width: 100%;
    }
    input[type="submit"]:hover {
        background-color: #e77f89;
    }
</style>
</head>
<body>
<link href="https://fonts.googleapis.com/css?family=DM+Sans:400,500,700&display=swap" rel="stylesheet">
<div class="task-manager">
  <div class="left-bar">
    <div class="upper-part">
      <div class="actions">
        <div class="circle"></div>
        <div class="circle-2"></div>
      </div>
    </div>
    <div class="left-content">
      <ul class="action-list">
        <li class="item">
        <a href="adminDashboard.jsp" style="color: black;text-decoration: none;">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="feather feather-inbox"
            viewBox="0 0 24 24">
            <path d="M22 12h-6l-2 3h-4l-2-3H2" />
            <path
              d="M5.45 5.11L2 12v6a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2v-6l-3.45-6.89A2 2 0 0 0 16.76 4H7.24a2 2 0 0 0-1.79 1.11z" />
          </svg>
          <span>Add Product</span>
          </a>
        </li>
        <li class="item">
      <a href="Admin_customer.jsp" style="color: black;text-decoration: none;">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
            class="feather feather-star">
            <polygon
                points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
        </svg>
         <span>Customers</span>
    </a>
</li>
      <li class="item">
      <a href="Admin_Search.jsp" style="color: black;text-decoration: none;">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
            class="feather feather-star">
            <polygon
                points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
        </svg>
         <span>Search</span>
    </a>
</li>  

<li class="item">
      <a href="Admin_Contact.jsp" style="color: black;text-decoration: none;">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
            class="feather feather-star">
            <polygon
                points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
        </svg>
         <span>Contact Details</span>
    </a>
</li>

<li class="item">
      <a href="LogOut" style="color: black;text-decoration: none;">
        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
            class="feather feather-star">
            <polygon
                points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2" />
        </svg>
         <span>Log Out</span>
    </a>
</li>    
     
      </ul>
     
    </div>
  </div>
  <div class="page-content">
    <div class="header">Add Product</div>
    <div class="content-categories">
      <div class="label-wrapper">
        <input class="nav-item" name="nav" type="radio" id="opt-1">
        <label class="category" for="opt-1">Add Flowers</label>
      </div>
      
    </div>
    <div class="tasks-wrapper">
    <form  action="addFlower" method="post" enctype="multipart/form-data">
        <label for="imageFile"> Upload Image:</label>
        <input type="file" id="imageFile" name="imageFile" accept="image/*" required>

        <label for="imageName">Image Name:</label>
        <input type="text" id="imageName" name="imageName" required>

        <label for="category">Category:</label> 
        <select id="category" name="category" required>
            <option value="" >Select a category</option>
            <option value="bouquet"> bouquet</option>
            <option value="Fuctional">Fuctional</option>
            <option value="Red Rose">Red Rose</option>
            <option value="Marriage ">Marriage </option>
            <option  value="birtday">birtday</option>
        </select>
        
        <label for="totalprice">Total Price:</label>
    <input type="text" id="totalprice" name="totalprice" oninput="calculateRemaining()" required>

    <label for="remaining">Remaining Price:</label>
    <input type="text" id="remaining" name="remaining" readonly required>
    
     <label for="remaining">paid Price:</label>
    <input type="text" id="paid" name="paid" readonly required>

        <input type="submit" value="Upload Image">
    </form>
</div>
  </div>
  <div class="right-bar">
   
</div>
<script>
    function calculateRemaining() {
        var totalPrice = parseFloat(document.getElementById('totalprice').value);
        var remainingPrice = totalPrice * 0.6;
        var paidprice=totalPrice-remainingPrice
        // Display the calculated remaining price in the remaining input field
        document.getElementById('remaining').value = remainingPrice;
        document.getElementById('paid').value = paidprice;
    }
</script>
</body>
</html>