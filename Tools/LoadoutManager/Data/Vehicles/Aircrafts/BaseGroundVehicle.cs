using System.Linq;
using System.Runtime.Serialization;
using System.Text;

public abstract class BaseGroundVehicle : BaseVehicle
{
    protected override string GenerateCommentForTheSqfCode()
    {
        return "// " + inGameDisplayName + " [" + EnumExtensions.GetEnumMemberAttrValue(producedFromFactoryType)
                + InGameFactoryLevel + "]";
    }
}