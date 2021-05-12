<template>
<body>
    <div class="review">
        <div class="form">
            <form class="review-form">
                <input type="text" placeholder="Rubrik">
                <input type="text" placeholder="Namn">
                <p>
                    <label class="rating">Omdöme:</label>
                    <select id="rating">
                        <option>10</option>
                        <option>9</option>
                        <option>8</option>
                        <option>7</option>
                        <option>6</option>
                        <option>5</option>
                        <option>4</option>
                        <option>3</option>
                        <option>2</option>
                        <option>1</option>
                    </select>
                </p>
                <textarea class="textarea" cols="30" rows="10"></textarea>
                <button>Lämna recension</button> 
            </form> 
        </div>
    </div>
</body>
</template>

<script>

export default {
    data(){
        return {
           
        }
    },
   
   
    
}
</script>

<style scoped>
.textarea{
    resize: none;
    width:100%;
    margin:auto;
}
.review{
    width:360px;
    padding: 10% 0 0;
    margin: auto;
}
.form input{
    font-family: "Roboto", sans-serif;
    outline:1;
    background: #f2f2f2;
    width:100%;
    border:0;
    margin:0 0 15px;
    padding: 10px;
    box-sizing: border-box;
    font-size: 14px;
}
.form {
    position: relative;
    z-index: 1;
    background: rgba(7,40,195, 0.8);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 45px;
    text-align: center;
}
.rating{
    color:white;
}
.form button{
    font-family: "Roboto", sans-serif;
    text-transform: uppercase;
    outline:0;
    background:#4CAF50;
    width: 100%;
    border: 0;
    padding:15 px;
    color:#FFFFFF;
    font-size: 14px;
    cursor: pointer;
}
</style>