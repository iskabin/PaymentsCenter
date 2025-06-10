interface ChipProps {
	text: string,
	type: "default" | "success" | "danger"
}

export function Chip({ text, type }: ChipProps) {
	let color: string;

	switch (type) {
		case "success":
			color = "bg-green-600"
			break;

		case "danger":
			color = "bg-red-600"
			break;

		default:
			color = "bg-blue-600"
			break;
	}

	return (
		<div className={color + " text-neutral-50 font-medium text-center rounded-md"}>{text.toUpperCase()}</div>
	);
}