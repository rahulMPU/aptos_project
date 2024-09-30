module MyModule::RideSharing {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    struct Ride has store, key {
        driver_address: address,  // Address of the driver
        fare: u64,                // Fare for the ride
    }

    /// Function for drivers to list their ride availability.
    public fun list_ride(driver: &signer, fare: u64) {
        let ride = Ride {
            driver_address: signer::address_of(driver),
            fare,
        };
        move_to(driver, ride);
    }
}
