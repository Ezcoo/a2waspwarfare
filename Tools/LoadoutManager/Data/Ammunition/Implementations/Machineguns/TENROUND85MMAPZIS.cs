public class TENROUND85MMAPZIS : BaseAmmunition
{
    public TENROUND85MMAPZIS()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TENROUND85MMAPZIS };
        amountPerPylon = 5;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.ZISS53.ToString()) as BaseWeapon;
        ammoDisplayName = "Zis-53" +
            "";
        costPerPylon = 9999999;
    }
}