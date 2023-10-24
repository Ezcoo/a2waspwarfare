"WFBE_CL_MASH_MARKER_CREATED" addPublicVariableEventHandler {

	private ["_tentObject","_sideDeployer","_deployer"];

	_tentObject = _this select 1 select 0;
	_sideDeployer = _this select 1 select 1;
	_deployer = _this select 1 select 2;

	WFBE_SE_MASH_MARKER_SENT = [getPos _tentObject, _sideDeployer, _deployer, _tentObject];

	publicVariable "WFBE_SE_MASH_MARKER_SENT";

};