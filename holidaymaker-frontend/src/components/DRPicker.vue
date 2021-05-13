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
                    <button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#guestsModal" id="guestsButton">
                        <i class="fas fa-users" id="guestsIcon"></i>
						<p> Guests</p> 
                    </button>

					<!-- Modal -->
					<div class="modal fade" id="guestsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							...
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
						</div>
					</div>
					</div>




				</div>
			</div>
		</div>
	</div>
</div>
</template>