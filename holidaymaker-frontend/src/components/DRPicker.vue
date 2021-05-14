<template>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-6" id="datesDiv">
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#dateModal" id="datesButton">
						<i class="far fa-calendar-alt" id="calendarIcon"></i> Dates
					</button>
				</div>
				
				<div class="col-md-6" id="guestsButtonDiv">
					<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#guestsModal" id="guestsButton">
						<i class="fas fa-users" id="guestsIcon"></i> Guests
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- DATES MODAL -->
<div class="modal fade" id="dateModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Dates</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
				
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-4"><i class="far fa-calendar-check" id="checkInIcon"></i> Checkin </div>
							<div class="col-md-4 ml-auto">
  								<label class="form-label" for="typeNumber"><i class="far fa-calendar-times" id="checkOutIcon"></i> Checkout </label>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<input type="date" id="start" name="checkinDate">
							</div>
							<div class="col-md-4 ml-auto">
  								<input type="date" id="start" name="checkinDate">
							</div>
						</div>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">
							Close
						</button>
						<button type="button" class="btn btn-primary">
							Save changes
						</button>
					</div>
				</div>
		</div>
	</div>
</div>

<!-- GUESTS MODAL -->
<div class="modal fade" id="guestsModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Amount of guests and rooms</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
			</div>
				
				<!-- ADD V-FOR BELOW TO INCREASE MODAL DYNAMICALLY -->
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-4">
								Room X 
								<button type="button" class="btn btn-danger btn-sm">
									Delete
								</button>
							</div> 
							<div class="col-md-4 ml-auto">
								<input type="number" id="typeNumber" class="form-control" />
  								<label class="form-label" for="typeNumber">Guests</label>
							</div>
						</div>
							<hr>

						<div class="row">
							<div class="col-md-4">
								<button type="button" class="btn btn-primary btn-sm">
									Add room
								</button>
							</div>
						</div>
							<br> 
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">
							Close
						</button>
						<button type="button" class="btn btn-primary">
							Save changes
						</button>
					</div>
				</div>
		</div>
	</div>
</div>



</template>