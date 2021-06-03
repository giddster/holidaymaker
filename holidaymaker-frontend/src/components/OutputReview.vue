<template>
    <section>
        <div class="FixedHeightContainer">
            <h2>Reviews</h2>
            <button @click="dispatchReview" class="btn btn-primary">See reviews</button>
            <div class="scroll">
                <div v-for="review in reviews" :key="review" class="content">
                    <p><i>Rating: </i>{{review.rating}}</p>
                    <p><i>Review: </i>{{review.reviewText}}</p>  
                </div>
            </div>
        </div>
    </section>
</template>

<script>
export default {
    computed:{
      reviews(){
        return this.$store.state.reviews    
      }
    },
    methods: {
        dispatchReview(){
            this.$store.dispatch('fetchReviews');
        }
    }
}
</script>

<style scoped>
.FixedHeightContainer
{
  float:right;
  height: 250px;
  width:400px; 
  padding:3px; 
    background: rgb(246, 246, 252);
}
.scroll
{
  height:180px;
   overflow-x: hidden;
   overflow-y: auto;
    background: rgb(246, 246, 252)
}
h2{
    font-size: 20px;
}
button{
    width:100%;
    padding: 0px;
}
</style>