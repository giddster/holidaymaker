<template>
    <section>
        <div class="FixedHeightContainer">
            <button @click="dispatchReview" class="btn btn-lg btn-primary" :id="{active:isActive}">{{isActive ? 'Reviews' : 'See Reviews'}}</button>
            <div class="scroll">
                <div v-for="review in reviews" :key="review" class="content">
                    
                    <p class="review-rating">Rating: {{ review.rating }}/10 &nbsp; </p>

                    <div class="review-emoji">
                        <div v-if="review.rating == 10">
                            <i class="far fa-grin-hearts" style="color:hotpink;"></i> 
                        </div>
                        <div v-else-if="review.rating > 7">
                         <i class="far fa-grin-beam" style="color:green;"></i> 
                        </div>
                        <div v-else-if="review.rating >= 5" style="color:green;">  
                            <i class="far fa-smile"></i>
                        </div>
                        <div v-else-if="review.rating <= 4 && review.rating > 2"> 
                            <i class="far fa-meh" style="color:gray;"></i>
                        </div>
                        <div v-else>
                            <i class="far fa-angry" style="color:red;"></i> 
                        </div>
                    </div>
                    
                    <b class="reviewtext-heading">Review: </b>
                    <p class="review-text"><i>{{ review.reviewText }}</i></p>
                    <p v-if="review.name !=null" class="review-name"> Review submitted by: {{ review.name }}</p>
                    
                    <hr>  
                </div>
            </div>
            
        </div>
    </section>
</template>

<script>
export default {
    data() {
        return {
            isActive: false,
        }
    },
    methods: {
        dispatchReview(){
            this.$store.dispatch('fetchFilteredReviews', this.$route.params.id)

            this.isActive = !this.enable;
            }
        },
    computed:{
      reviews(){
        return this.$store.state.filteredReviews
      }    
    
    }
}
</script>

<style scoped>

.FixedHeightContainer
{
    float: right;
    height: 635px;
    width: 500px; 
    padding:3px; 
    background: rgb(246, 246, 252);
}

.scroll
{
  height:100%;
   overflow-x: hidden;
   overflow-y: auto;
    background: rgb(246, 246, 252)
}

.averageuserrating-title {
    color: lightcoral;
    margin-bottom: 10px;
}

button{
    width:100%;
    padding: 0px;
}

.review-emoji {
    font-size: 28px;
    display: inline-flex;
}

.review-rating {
    display: inline-flex;
    font-size: 18px;
    color: lightcoral;
}

.reviewtext-heading {
    color: lightcoral;
    display: block;
    font-weight: lighter;
}

.review-text{
    font-weight: lighter;
    font-size: 16px;
}

.review-name{
    color: lightcoral;
    font-style: normal;
    font-size: 14px;
}
</style>