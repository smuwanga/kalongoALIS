<?php
/**
 * Tests the UserController functions that store, edit and delete users 
 * @author  (c) @iLabAfrica, Emmanuel Kitsao, Brian Kiprop, Thomas Mapesa, Anthony Ereng
 */
class MigrationSeedTest extends TestCase 
{
    /**
    * Initial setup function for tests
    *
    * @return void
    */
    public function setUp(){
        parent::setUp();
        Artisan::call('migrate');
        Artisan::call('db:seed');
        Artisan::call('update:seed');
    }

	/**
	 * Tests the store function in the UserController
	 * @return int $testUserId ID of User stored; used in testUpdate() to identify test for update
	 */    
 	public function testHome() 
	{
        $this->call('GET', '/');
        $this->assertResponseOk();
	}
}