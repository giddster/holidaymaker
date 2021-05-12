<template>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4" id="checkInDiv">
                    <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="checkinDateButton">
                        <i class="far fa-calendar-check" id="checkInIcon"></i>
                        Checkin date
                    </button>
				</div>

				<div class="col-md-4" id="checkOutDiv">
                    <button class="btn btn-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="checkOutDateButton">
                        <i class="far fa-calendar-times" id="checkOutIcon"></i>
                        Checkout date
                    </button>
				</div>
                
				<div class="col-md-4" id="guestsButtonDiv">
                    <button type="button" class="btn btn-info btn-md" id="guestsButton">
                        <span>
                        <i class="fas fa-users" id="guestsIcon"> Guests</i> 
                        </span>
                    </button>
				</div>
			</div>
		</div>
	</div>
</div>



</template>