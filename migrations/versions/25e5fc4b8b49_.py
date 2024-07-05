"""empty message

Revision ID: 25e5fc4b8b49
Revises: dc78094b5452
Create Date: 2024-05-16 05:22:36.660877

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '25e5fc4b8b49'
down_revision = 'dc78094b5452'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('prop_images', schema=None) as batch_op:
        batch_op.add_column(sa.Column('property_id', sa.Integer(), nullable=True))
        batch_op.create_foreign_key(None, 'property', ['property_id'], ['property_id'])

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('prop_images', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='foreignkey')
        batch_op.drop_column('property_id')

    # ### end Alembic commands ###
