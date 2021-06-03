<template>
<body>
    <div class="review">
        <div class="form">
            <form @submit.prevent="submit" class="review-form">
                <input type="text" placeholder="Heading" v-model="form.heading">
                <input type="text" placeholder="Name" v-model="form.name">
                <input type="text" placeholder="HotelId" v-model="form.hotelId">
                <input type="text" placeholder="CustomerId" v-model="form.customerId">
                <p>
                    <label class="rating">Rating:</label>
                    <select v-model="form.rating" id="rating">
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
                <textarea class="textarea" cols="30" rows="10" v-model="form.reviewText"></textarea>
                <button >Leave Review</button> 
            </form> 
        </div>
    </div>
</body>
</template>

<script>

export default {
    data(){
        return {
            form: {
                
                rating: 0,
                customerId: 0,
                hotelId: 0,
                heading: '',
                name: '',
                reviewText: '',
                
            }
        }
    },
    methods: {
        submit(event){
            event.preventDefault()
            let formData = {reviewText: this.form.reviewText, rating: this.form.rating,
            customerId: this.form.customerId, hotelId: this.form.hotelId, 
            heading: this.form.heading, name: this.form.name}
            console.log('objekt med data från formuläret', formData)
            this.$store.dispatch('postReview', formData)
            this.form.rating = 0,
            this.form.customerId = '',
            this.form.hotelId = '',
            this.form.heading = '',
            this.form.name = '',
            this.form.reviewText = ''
        }
    }
   
        
    
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
    background: #fbfbfb;
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
    background: rgb(246, 246, 252);
    max-width: 360px;
    margin: 0 auto 100px;
    padding: 45px;
    text-align: center;
    border-style:solid;
    border-width:1px;
    border-radius: 10px;
}
.rating{
    color:black;
    padding: 3px;
}
.form button{
    font-family: "Roboto", sans-serif;
    text-transform: uppercase;
    outline:0;
    background:lightcoral;
    width: 100%;
    border: 0;
    padding:15 px;
    color:#FFFFFF;
    font-size: 14px;
    cursor: pointer;
    border: 1px solid lightcoral;
    
}
form button:hover{
    background: rgb(246, 114, 114);
    border: 1px solid lightcoral;
}


</style>