import { models, model, Schema } from 'mongoose'

const TemplateNameSchema = new Schema(
	{
		name: {
			type: String,
			default: 'guest',
		},
	},
	{ timestamps: true }
)

module.exports =
	models.TemplateName || model('TemplateName', TemplateNameSchema)
