<template>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-12">
			<div class="row">
				<div class="col-md-4" id="checkInDiv">
                    <button class="btn btn-primary btn-md dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="checkInDateButton">
                        <i class="far fa-calendar-check" id="checkInIcon"></i>
                        <p>Checkin date</p>
                    </button>
				</div>

				<div class="col-md-4" id="checkOutDiv">
                    <button class="btn btn-primary btn-md dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="checkOutDateButton">
                        <i class="far fa-calendar-times" id="checkOutIcon"></i>
                        <p> Checkout date</p>
                    </button>
				</div>
                
				<div class="col-md-4" id="guestsButtonDiv">
                    <button type="button" class="btn btn-info btn-md" id="guestsButton">
                        <i class="fas fa-users" id="guestsIcon"></i>
						<p> Guests</p> 
                    </button>
				</div>
			</div>
		</div>
	</div>
</div>

</template>