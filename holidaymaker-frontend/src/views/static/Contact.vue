<template>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <br>
            <b>What can we do for you?</b>
            <p class="pos3">
                At HolidayMaker, we appreciate your questions, comments and requests.
            </p>
            <b>Customer satisfaction</b>
            <br>
            <p class="pos3">
               We want to make sure your dream holiday becomes reality. If anything doesn't live up to your expectations, please feel free to complain about it to someone who feels like listening!
            </p>
            
            <b>Other things</b>
            <br>
            <p class="pos3">
               If you want to reach us, you can try! No promises.
            </p>

            <b>Send us an e-mail:</b>
            <br>
            <a href="mailto:fuhgetaboutit@holidaymaker.com" target="_blank">help_me_plz_im_dying@holidaymaker.com</a>
            <br>
            <br>
            <b>Give us a call (make our intern happy, he has nothing to do but answer the phone):</b>

            <p>+46701231234</p>

            <b>Use the form below to send us an angry message:</b>
            <br>
            <br>
            <p>
                <left>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter1">
                        Write message (or haiku poem)
                    </button>
                </left>
            </p>

            <br />



            <br />
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">What do you want?!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body">
                <form action="">
                    <div class="form-group">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="row">

                                        <div class="col-6 col-sm-12">

                                             <label for="title">Your official title:</label>

                                                <select name="title" id="personTitle">
                                                <option value="Monsieur">Monsieur</option>
                                                <option value="Señora">Señora</option>
                                                <option value="Doctor">Dr.</option>
                                                <option value="Time traveller">Time traveller</option>
                                                </select> 
                                            <p>
                                                First name:<br>
                                                <input type="text" />
                                            </p>

                                            <p>
                                                Last name:<br>
                                                <input type="text" />
                                            </p>

                                            <p>
                                                E-mail:<br>
                                                <input type="text" />
                                            </p>

                                            <p>
                                                Write a rhyme about potatoes:<br>
                                                <textarea cols="23" rows="12"></textarea>
                                            </p>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Send</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            </div>
        </div>
    </div>
</div>

</template>